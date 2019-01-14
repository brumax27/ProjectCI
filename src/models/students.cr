class Students < Granite::Base
  adapter pg
  table_name students

  primary id : Int64
  field name : String
  field age : Int32
  field grade : String
  timestamps
end
