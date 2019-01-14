require "./spec_helper"

def students_hash
  {"name" => "Fake", "age" => "1", "grade" => "Fake"}
end

def students_params
  params = [] of String
  params << "name=#{students_hash["name"]}"
  params << "age=#{students_hash["age"]}"
  params << "grade=#{students_hash["grade"]}"
  params.join("&")
end

def create_students
  model = Students.new(students_hash)
  model.save
  model
end

class StudentsControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe StudentsControllerTest do
  subject = StudentsControllerTest.new

  it "renders students index template" do
    Students.clear
    response = subject.get "/students"

    response.status_code.should eq(200)
    response.body.should contain("students")
  end

  it "renders students show template" do
    Students.clear
    model = create_students
    location = "/students/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Students")
  end

  it "renders students new template" do
    Students.clear
    location = "/students/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Students")
  end

  it "renders students edit template" do
    Students.clear
    model = create_students
    location = "/students/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Students")
  end

  it "creates a students" do
    Students.clear
    response = subject.post "/students", body: students_params

    response.headers["Location"].should eq "/students"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a students" do
    Students.clear
    model = create_students
    response = subject.patch "/students/#{model.id}", body: students_params

    response.headers["Location"].should eq "/students"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a students" do
    Students.clear
    model = create_students
    response = subject.delete "/students/#{model.id}"

    response.headers["Location"].should eq "/students"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
