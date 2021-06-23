class GeneratorConfig < ApplicationRecord
    belongs_to :generator

    validates :track_different_eos, default: false
end
