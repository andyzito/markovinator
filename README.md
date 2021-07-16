# README
**BETA Version 0.1.0**

**Author:** [Andrew Zito (andyzito.github.io)](https://andyzito.github.io)

The Remarkable Markovinator (not yet trademarked) is an experimental/demo Ruby on Rails application. It allows users to save arbitrary text content with taxonomic tags. "Generators" are also tagged, and each Generator will create a Markov model based on text content with matching tags. The Generator will then output sample text based on the Markov model.

## Quick Guide

**Generators** generate text based on a Markov model.
**Snippets** are a "corpus" of text content from which Markov models are generated.
**Tags** tell _Generators_ which _Snippets_ to use when training the model.

Because this is a demo, the application is in read-only mode.

## The Linguistics

A Markov model represents a corpus of text as transitional probabilities between tokens. In other words, the model contains data for any given token (a word or punctuation) on the probability of that token being followed by any other token. The probabilities are derived from the corpus when the model is "trained". The training process involves iterating over every token in the corpus. The most basic form of the algorithm for each token can be described as follows:

1. If this token is not in the model, add it (pseudocode: `Model[token] = {}`).
2. If the token after this token (token²) is not tracked, add it (pseudocode: `Model[token][token²] = 0`).
3. If token² *is* already tracked, increment the count (pseudocode: `Model[token][token²] += 1`).

The model can then be used to produce potentially valid natural language strings. This process is even simpler. A first token is selected, and then a random token is picked to follow it from the list of possible following tokens, weighted by probability.

Currently, the Markov model training in this application is quite naive. For example, more advanced Markov models track probabilities over chains of tokens longer than two. I hope to implement this functionality in the future.

## Theoretical Uses

There are several possible purposes the Markovinator could serve. The first is: fun! It is amusing to play with generative models like this, and experiment with generating samples from different corpuses. As the Markovinator grows more advanced, and more model configuration becomes possible, it could also be used in an educational setting.

## Future Enhancements

In hypothetical (or possibly not so hypothetical) future iterations of this application, I hope to implement the following:

* Improved accessibility (a full audit of the interface needs to be conducted)
* More built-in corpus data
* User accounts (and disable read-only mode!)
* The ability to alter how the model is generated, including but not limited to:
  * Which types of token to track
  * Length of probability chain (2+)
  * Arbitrary tokenization/detokenization rules
* Interactive/prettier Model viewer
  * Possibly a tree diagram?
  * Collapse/expand each token chain/list
* Interactive/prettier "sample" viewer
  * Display model probability between each generated word
  * Allow user to change any word and regenerate the sample tokens following it
* Generators based on large standard corpuses whose models can then be extended with application-local content
* Ability to feed Tag or Snippet(s) from Twitter or other social media
* Ability to auto-create Snippet from URL