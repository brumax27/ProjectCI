.row
  .col-sm-11
    h2 Students
  .col-sm-1
    a.btn.btn-success.btn-sm href="/students/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Age
        th Grade
        th Actions
    tbody
      - students.each do |students|
        tr
          td = students.name
          td = students.age
          td = students.grade
          td
            span
              == link_to("Show", "/students/#{students.id}", class: "btn btn-primary btn-sm")
              == link_to("Edit", "/students/#{students.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/students/#{ students.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
