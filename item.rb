class Item
   attr_reader :id, :archived

   def initialize(genre, author, source, label, published_date)
        @id = rand(1..100)
        @genre = genre
        @author = author
        @source = source
        @label = label
        @published_date = published_date
        @archived = false
   end

   def can_be_archived
     @published_date > 10
   end

end