require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @recipe = Recipe.new(name:"chicken parm" , summary:"best chicken ever" , description:"add sauce , slice onions , blah blah")
  end


  test 'recipe shoud be valid' do
    assert @recipe.valid?

  end

  test 'name should be present' do
    @recipe.name = ""
    assert_not @recipe.valid?
  end

  test 'name length should not be too long' do

    @recipe.name = "a" * 101
    assert_not @recipe.valid?


  end

  test 'name length should not be too short' do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?

  end

  test 'summary should be present' do
    @recipe.summary = ""
    assert_not @recipe.valid?

  end

  test 'summary should not be too long ' do
    @recipe.summary = "a" *151
    assert_not @recipe.valid?

  end

  test 'summary should not be too short ' do
    @recipe.summary = "a" *9
    assert_not @recipe.valid?
  end


  test 'description should be present' do
    @recipe.description = ""
    assert_not @recipe.valid?
  end


  test 'description should not be too long ' do
    @recipe.description = "a" * 500
    assert_not @recipe.valid?
  end

  test 'description should not be too short ' do
    @recipe.description = "a" * 9
    assert_not @recipe.valid?
  end

end