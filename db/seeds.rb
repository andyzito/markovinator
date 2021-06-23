# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Snippet.create(
    title: 'A Robot\'s Life Chapter 1',
    body: 'meep boop zeep zorp. bleep. plink meep zop bing zip bap ponk boop beep.',
    tag_list: 'robot'
)
Snippet.create(
    title: 'A Robot\'s Life Chapter 2',
    body: 'zeeeeep. zeep badonk bink beep tink zik zeep ziboop. ping clunk wiz zop beeeeee zzrt veep morp.',
    tag_list: 'robot'
)
Snippet.create(
    title: 'A Villain Monologues Chapter 1',
    body: 'You fools. You absolute imbeciles! Can you even conceive of what you have wrought? Can your tiny brains even grasp at the incontemplatable stupidity of what you have just done? My power now grows even stronger than before, stronger than any being in this feeble world, stronger than any who can stand against me! All of you shall kneel at my feet like the mewling children that you are.',
    tag_list: 'villain'
)
Snippet.create(
    title: 'A Villain Monologues Chapter 2',
    body: 'And now you choose to challenge me here, in my place of power, in the center of my fortress, where my strength is at its peak? The mind boggles at your pathetic attempts to outmaneuver me. You have stepped directly into my jaws and I will crush you like so many ripe berries, you insolent little cowards.',
    tag_list: 'villain'
)

Generator.create(
    name: 'A Robot',
    tag_list: 'robot',
)
Generator.create(
    name: 'A Villain',
    tag_list: 'villain',
)