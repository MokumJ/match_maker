user1 = User.create!(email:"mala12@gmail.com", password:"123456")
user2 = User.create!(email:"raka1@gmail.com", password:"123456")
user3 = User.create!(email:"wiki1@gmail.com", password:"123456")
user4 = User.create!(email:"woush4@gmail.com", password:"123456")
user5 = User.create!(email:"wal1@gmail.com", password:"123456")
user6 = User.create!(email:"bal2@gmail.com", password:"123456")
user7 = User.create!(email:"bom3@gmail.com", password:"123456")
user8 = User.create!(email:"bam4@gmail.com", password:"123456")


profile1 = Profile.create!(first_name:"profile1", last_name:"last name", role:"student", user:user1)
profile2 =  Profile.create!(first_name:"profile2", last_name:"last name", role:"admin", user:user2)
profile3 =  Profile.create!(first_name:"profile3", last_name:"last name", role:"admin", user:user3)
profile4 =  Profile.create!(first_name:"profile4", last_name:"last name", role:"student", user:user4)
profile5 =  Profile.create!(first_name:"profile5", last_name:"last name", role:"student", user:user5)
profile6 =  Profile.create!(first_name:"profile6", last_name:"last name", role:"student", user:user6)
profile7 =  Profile.create!(first_name:"profile7", last_name:"last name", role:"student", user:user7)
profile8 =  Profile.create!(first_name:"profile8", last_name:"last name", role:"student", user:user8)

