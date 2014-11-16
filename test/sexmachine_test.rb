# -*- coding: utf-8 -*-
require 'minitest/autorun'
lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'genderdetector'

class GenderDetectorTest < MiniTest::Test
  def setup
    @d = GenderDetector::Detector.new
  end

  def test_get_gender
    assert_equal :andy, @d.get_gender("Bob")
    assert_equal :andy, @d.get_gender("Sally")
    assert_equal :andy, @d.get_gender("Pauley")
  end

  def test_gender_international
    assert @d.knows_country?(:great_britain)
    assert_equal :andy, @d.get_gender("Álfrún")
  end

  def test_country_specific_preference
    assert_equal :andy, @d.get_gender("Jamie")
    assert_equal :andy, @d.get_gender("Jamie", :great_britain) #jamie oliver?
  end

  def test_case_insensitivity
    d = GenderDetector::Detector.new(:case_sensitive => false)
    assert_equal :andy, d.get_gender("sally")
    assert_equal :andy, d.get_gender("Sally")
  end

  def test_name_exists
    d = GenderDetector::Detector.new(:case_sensitive => false)
    assert d.name_exists?("Sally")
    assert d.name_exists?("Carlos")
    assert d.name_exists?("Rosario")
  end
end
