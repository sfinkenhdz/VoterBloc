100.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "password",
    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    voter_registration_status: 1,
    street_address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip
    )
end

counter_id = 1
4.times do
  Team.create!(
    organizer_id: counter_id,
    name: Faker::Team.name,
    location: Faker::Address.city,
    membership_goal: 25
  )
  counter_id += 25
end

Election.create!(
  date: Faker::Date.forward(60),
  description: "Chicago mayoral election")

Election.create!(
  date: Faker::Date.forward(100),
  description: "Presidential election")

4.times do
  election_counter = 1
  2.times do
    Participation.create!(
    team_id: counter_id,
    election_id: election_counter)
    election_counter += 1
  end
  counter_id += 1
end


member_id = 1
4.times do
  25.times do
    Membership.create!(
      user_id: member_id,
      team_id: counter_id
      )
    member_id += 1
  end
  counter_id += 1
end

4.times do
  25.times do
    Invitation.create!(
      user_id: member_id,
      team_id: counter_id
      )
    member_id += 1
  end
  counter_id += 1
end

election_id = 1
2.times do
  50.times do
    # this could result in multiple records for a specific voter in each election
    # will deal with that if it's a problem
    Vote.create!(
      voter_id: rand(1..100),
      election_id: election_id
      )
  end
  election_id += 1
end


30.times do
  team = rand(1..4)
  Comment.create!(
    team_id: team,
    commenter_id: rand(team..team+24),
    body: Faker::Lorem.paragraph
    )

end
