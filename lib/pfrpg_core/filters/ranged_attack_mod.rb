module PfrpgCore
  module Filters
    class RangedAttackMod
      attr_reader :character
      def initialize(character)
        @character = character
      end

      def filter(attack)
        modify_attack_for_ranged_attack(attack, character.attributes.dex_mod, character.attributes.str_mod)
      end

      def modify_attack_for_ranged_attack(attack, dex, str)
        begin
          ranged = attack.range.to_i
          if !(ranged == nil || ranged == '' || ranged <= 10)
            attack.filter_str << "Range Bonus: -#{dex}, +#{str}"
            attack.other_bonus += dex
            attack.other_bonus -= str
          end
        rescue Exception => e
        end
      end
    end
  end
end
