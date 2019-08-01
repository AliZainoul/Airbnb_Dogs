require 'faker'

Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all
City.destroy_all


#Generate 4 Cities
city_1 = City.create(city_name: "Paris")
city_2 = City.create(city_name: "Lille")
city_3 = City.create(city_name: "Montpellier")
city_4 = City.create(city_name: "Bordeaux")
t_cities = []
t_cities << city_1
t_cities << city_2
t_cities << city_3
t_cities << city_4

#Generate k dogs
k = 20
t_dogs = []
k.times do
  dog = Dog.create(dog_name: Faker::Creature::Dog.name)
  dog.city = t_cities.sample
  dog.save
  t_dogs << dog
end

#Generate m entries in the BDD
m = 50
m.times do
  dogsitter = Dogsitter.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  dogsitter.city = t_cities.sample
  dogsitter.save
  #Generating Strolls
  stroll_1 = Stroll.create(dogsitter: dogsitter, dog: t_dogs.sample)
  stroll_2 = Stroll.create(dogsitter: dogsitter, dog: t_dogs.sample)
  stroll_1.city = t_cities.sample
  stroll_1.save
  stroll_2.city = t_cities.sample
  stroll_2.save
end
