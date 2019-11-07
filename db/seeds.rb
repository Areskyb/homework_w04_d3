require_relative('../models/student')
require_relative('../models/house')
require('pry')

house1 = House.new({
  'name' => 'Gryffindor',
  'logo_url' => 'https://p7.hiclipart.com/preview/756/441/275/sorting-hat-hogwarts-harry-potter-and-the-deathly-hallows-gryffindor-harry-potter.jpg'
  })
house2 = House.new({
  'name' => 'Hufflepuff',
  'logo_url' => 'https://cdn.nohat.cc/thumb/f/720/m2i8N4Z5i8Z5Z5Z5.jpg'
  })
house3 = House.new({
  'name' => 'Ravenclaw',
  'logo_url' => 'https://p7.hiclipart.com/preview/563/589/122/ravenclaw-house-fictional-universe-of-harry-potter-common-room-hogwarts-gryffindor-harry-potter-ravenclaw-thumbnail.jpg'
  })
house4 = House.new({
  'name' => 'Slytherin',
  'logo_url' => 'https://toppng.com/public/uploads/preview/slytherin-crest-by-rosalind5-maison-serpentard-fierte-harry-potter-slytherin-logo-11563207918furexv0euu.png'
  })

house1.save()
house2.save()
house3.save()
house4.save()

student1 = Student.new({
  'first_name' => 'Harry',
  'second_name' => 'Potter',
  'house' => house1.id,
  'age' => 12
  })

student2 = Student.new({
  'first_name' => 'Katie',
  'second_name' => 'Bell',
  'house' => house1.id,
  'age' => 11
  })

student3 = Student.new({
  'first_name' => 'Lee',
  'second_name' => 'Joordan',
  'house' => house1.id,
  'age' => 12
  })

student4 = Student.new({
  'first_name' => 'Susan',
  'second_name' => 'Bones',
  'house' => house2.id,
  'age' => 12
  })

student1.save()
student2.save()
student3.save()
student4.save()
