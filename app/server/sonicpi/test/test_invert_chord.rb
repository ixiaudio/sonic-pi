#--
# This file is part of Sonic Pi: http://sonic-pi.net
# Full project source: https://github.com/samaaron/sonic-pi
# License: https://github.com/samaaron/sonic-pi/blob/master/LICENSE.md
#
# Copyright 2013, 2014, 2015 by Sam Aaron (http://sam.aaron.name).
# All rights reserved.
#
# Permission is granted for use, copying, modification, and
# distribution of modified versions of this work as long as this
# notice is included.
#++

require 'test/unit'
require_relative "../../core"
require_relative "../lib/sonicpi/chord"
require_relative "../lib/sonicpi/mods/sound"

module SonicPi
  module Mods
    module Sound
      module_function :invert_chord
      module_function :chord
    end
  end
  class InvertChordTester < Test::Unit::TestCase

    def test_inversion_of_basic_major
      assert_equal(Mods::Sound.invert_chord(Chord.new(:C4, :major), 0), [60, 64, 67])
      assert_equal(Mods::Sound.invert_chord(Chord.new(:C4, :major), 1), [64, 67, 72])
      assert_equal(Mods::Sound.invert_chord(Chord.new(:C4, :major), 2), [67, 72, 76])

      # what should happen the other way...
      assert_equal(Mods::Sound.invert_chord(Chord.new(:C4, :major), -1).sort, [55, 60, 64])
      assert_equal(Mods::Sound.invert_chord(Chord.new(:C4, :major), -2).sort, [52, 55, 60])
      assert_equal(Mods::Sound.invert_chord(Chord.new(:C4, :major), -3).sort, [48, 52, 55])

      # edge case
      assert_equal(Mods::Sound.invert_chord(Mods::Sound.chord(:C4, "1"), 1), [72])
      assert_equal(Mods::Sound.invert_chord(Mods::Sound.chord(:C4, "1"), -1), [48])
    end

  end
end
