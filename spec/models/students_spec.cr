require "./spec_helper"
require "../../src/models/students.cr"

describe Students do
  Spec.before_each do
    Students.clear
  end
end
