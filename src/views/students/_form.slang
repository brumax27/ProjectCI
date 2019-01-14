- if students.errors
  ul.errors
    - students.errors.each do |error|
      li = error.to_s

== form(action: "/students/#{students.id.to_s}", method: students.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "name", value: students.name, placeholder: "Name", class: "form-control")
  .form-group
    == text_field(name: "age", value: students.age, placeholder: "Age", class: "form-control")
  .form-group
    == text_field(name: "grade", value: students.grade, placeholder: "Grade", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-sm")
  == link_to("Back", "/students", class: "btn btn-light btn-sm")
