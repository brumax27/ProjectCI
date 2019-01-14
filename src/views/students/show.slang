h1 Show Students
p = students.name
p = students.age
p = students.grade
p
  == link_to("Back", "/students", class: "btn btn-light btn-sm")
  == link_to("Edit", "/students/#{students.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/students/#{students.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
