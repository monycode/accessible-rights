# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

Question.destroy_all
Answer.destroy_all
Forum.destroy_all
User.destroy_all

puts "creating users"

main_user = User.create!(
  email: 'mainuser@gmail.com',
  password: "1234password",
  password_confirmation: "1234password",
  name: "John Smith"
)

users = []
14.times do
  users << User.create!(
    email: Faker::Internet.email,
    password: "1234password",
    password_confirmation: "1234password",
    name: Faker::Name.name
  )
end

puts "creating lawyers"

lawyers_names = ["Peter", "Ben", "Stephanie", "Andrea"]
lawyers = lawyers_names.map do |name|
  user = User.new(
    email: Faker::Internet.email,
    password: "1234password",
    password_confirmation: "1234password",
    name: name
  )
  file = File.open("db/support/#{name}.png")
  user.photo.attach(io: file, filename: "#{name}.png", content_type: 'image/png')
  user.education = "Harvard Law School"
  user.law_firm = "White & Case"
  user.location = "Mexico City"
  user.twitter_handle = "@#{name}lewagonx87"
  user.linkedin_url = "https://de.linkedin.com/in/peter-schmidt-366894100/es?trk=people-guest_people_search-card"
  user.save!
  user
end

puts "creating forums"


termination_forum = Forum.create!(
  name: 'Termination'
)

resigning_forum = Forum.create!(
  name: 'Resigning'
)

unpaid_bonus_forum = Forum.create!(
  name: 'Unpaid Bonus'
)

unpaid_hours_forum = Forum.create!(
  name: 'Unpaid Hours'
)

puts "creating questions and answers"

# TERMINATION

question_1 = Question.create!(
  title: 'Wrongful Termination Settlement',
  content: 'I was terminated in January from a tech company'\
           'with no probationary period, formal performance'\
           'improvement plan, or warning. I believe my termination'\
           'was a retaliatory act after raising alarm about falsified'\
           'information within the company. I received a severance offer,'\
           'but chose not to proceed with it as they requested I sign a release'\
           'of claims. Has anyone had success with a wrongful termination lawsuit'\
           'or settlement? If so, how long was the process from start to end and'\
           'roughly what was the pre trial or trial settlement amount?',
  forum: termination_forum,
  user: users.sample
)

answer_1 = Answer.create!(
  content: "It is possible to have sucess with a wrongful termination lawsuit, but you have to be prepared for a long and hard process.",
  user: lawyers[0],
  question: question_1
)

question_2 = Question.create!(
  title: "Wrongful Termination Settlement",
  content: "I was terminated in January from a tech companywith no probationary period, formal performance improvement plan or warning. I believe my terminationwas a retaliatory act after raising alarm about falsifiedinformation within the company. I received a severance offer,but chose not to proceed with it as they requested.",
  forum: termination_forum,
  user: users.sample
)

answer_2 = Answer.create!(
  content: "You have options, if you think your severance payment is not correspondent to what your owed, you could sue your employer for a fair settlement",
  user: lawyers[1],
  question: question_2
)

question_3 = Question.create!(
  title: 'I was Unfairly fired from Five Guys',
  content: 'I have been working at Five Guys for about three months now as part-time work to help pay for university. Everything has been going well, until a month ago a new manager came in and randomly started firing people without warning or time to look for another job. Is this fair, what can I do?',
  forum: termination_forum,
  user: users.sample
)

answer_3 = Answer.create!(
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi suscipit posuere aliquam. Fusce nec elit nunc. Suspendisse potenti. Proin eget fringilla odio. Nullam a magna lectus. Mauris luctus tempus metus, a tristique nisi hendrerit quis. Ut blandit felis a ligula dignissim tincidunt in sed turpis. ",
  user: lawyers[2],
  question: question_3
)

question_4 = Question.create!(
  title: 'Can my employer fire me for Medical Reasons on a probation period?',
  content: "For context this isn’t about me but one of my former co-workers. She requested off because she had a flight to catch to go for surgery. She notified our employer and I assumed approved it because she agreed to update UKG but come to find out our employer had said that she needed someone to cover the shift. No one (even me) could cover it. So she just went and fired her on the spot. We just want to know if we could take this to court even though she was on a probation period.",
  forum: termination_forum,
  user: users.sample
  )

answer_4 = Answer.create!(
  content: "based on the information you provided, I think you could have a solid case and a good oportunity on court. ",
  user: lawyers[3],
  question: question_4
)

question_5 = Question.create!(
  title: 'Can I fire an employee without warning?',
  content: "I own a small business and hired my first employee about 4 months ago. It's a retail store and the employee manages the store on his own when I am not able to be there. Last week he messaged me saying square wasn't working and he wasn't able to clock in when he got there. I told him to clock in when it started working and I would adjust it on the back end. He told me he got there at 1030 am and would be leaving at 5. I checked my alarm log to see when he opened the store and he didn't get there until 11. He texted me 3 different times that day saying he started at 1030, but the alarm log and security video shows him coming in at 11. I went back through the logs and he has consistently been clocking in a half hour early and clocking out a half hour late. Square has an app, so I am assuming he's using the app to clock in and out when he's not in the store. Can I fire him for this, or do I need to give him a warning to try and correct the behaviour? I don't trust him anymore so I don't want him in my store alone.",
  forum: termination_forum,
  user: users.sample
)

answer_5 = Answer.create!(
  content: "Although I understand you are upset, that alone isn't a valid reason to fire him, you should give him a warning and if the behavior continues then you should take measures. ",
  user: lawyers[0],
  question: question_5
)

# RESIGNING

question_6 = Question.create!(
  title: 'I was just put on a pip, should I resign?',
  content: "So I've spent the last year of my life working for a large consulting firm. This morning I joined a call with my team leader( middle manager) and someone from HR and I was informed that I was being put onto a pip. Their main concern was that I did not desire to gain the knowledge needed to understand my current role.
  Kinda seems like bs to me, I'm currently in an entry level position and have said yes to anything they have asked of me. I've traveled wherever they needed me and worked constant 60 hour weeks.
  In classic pip fashion there's three un-measurable metrics that I need to meet in 30 days or I will be terminated, I think the worse part is even if I meet the expectation in thirty days if I don't continue to meet them I can be terminated. So they could just kinda fire me whenever they want.
  Idk kinda feel like I've wasted a year of my life, at least I got osha 30 and 40 certs for free.",
  forum: resigning_forum,
  user: users.sample
)

answer_6= Answer.create!(
  content: "Your employer has to prove that you didn't met the metrics so they have a right to fire, if the metrics are un-measuble, then we could be looking at a wrongful termination. ",
  user: lawyers[1],
  question: question_6
)

question_7 = Question.create!(
  title: 'When and how should I resign?',
  content: 'I have recently interviewed for a new job, and yesterday I got a call telling me I got it, and today I received a formal written offer via email, which I’m supposed to sign and send back. My current job was my first ever, so this is the first time I’m changing jobs. This might be a silly question, but I just want to make sure I’m doing things correctly. Should I sign the offer and then resign or should I resign and then sign the offer? Are there any legal implications of doing it in the wrong order? I will be very grateful for any advice on this as I am a complete newbie to this!',
  forum: resigning_forum,
  user: users.sample
)

answer_7 = Answer.create!(
  content: "There is no legal difference on the order you do it, you are free to work wherever you want and you won't have a problem with that. ",
  user: lawyers[2],
  question: question_7
)

question_8 = Question.create!(
  title: "Forced to sign contract",
  content: "My boss made me sign a contract agreeing to take $150 out of my final pay check if I fail to serve a two weeks notice. Is that legal?",
  forum: resigning_forum,
  user: users.sample
  )

answer_8 = Answer.create!(
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi suscipit posuere aliquam. Fusce nec elit nunc. Suspendisse potenti. Proin eget fringilla odio. Nullam a magna lectus. Mauris luctus tempus metus, a tristique nisi hendrerit quis. Ut blandit felis a ligula dignissim tincidunt in sed turpis. ",
  user: lawyers[3],
  question: question_8
  )

# UNPAID BONUS

question_9 = Question.create!(
  title: "Unpaid bonus and can’t resign",
  content: "I have a bonus that was supposed to be paid out on or by 1/30/22. I have it in writing. I was verbally told I should receive it for the past two months and it hasn't shown up yet. I have a new position lined up but I am worried I wont get the bonus if I leave before it's paid. The bonus is for performance in 2021. The contract says if either party terminates employment the contract is void. If I quit am I still entitled to the bonus being that it's past due? How should I go about telling my boss that I’m leaving to not ruin my case? (Wisconsin)",
  forum: unpaid_bonus_forum,
  user: users.sample
)

answer_9 = Answer.create!(
  content: "if you resign, your employer still owes you that bonus, so It should be part of a fair settlement. ",
  user: lawyers[0],
  question: question_9
)

question_10 = Question.create!(
  title: 'Separation from job with unpaid bonuses',
  content: "I was just fired. I’d like to ask before I sign the separation agreement whether I am entitled to a bonus for 2020. I received a full bonus for 2019 but did not receive anything for 2020 even though I worked there the full year.
Additional details, in previous year the bonus was paid at the end of the year but this year HR put out a presentation explaining that there would be a long process that would drag out until February by the time they paid out. Then last week they put out an update that it wouldn’t be until March. Seems like they’ve been delaying bonuses and pushing people to resign or firing them before having to pay them. Advice?",
  forum: unpaid_bonus_forum,
  user: users.sample
)

answer_10 = Answer.create!(
  content: "If your bonus was previously agreed and the conditions were met, they have to pay you.",
  user: lawyers[1],
  question: question_10
)

question_11 = Question.create!(
  title: "Withholding my bonus",
  content: "Just put in my two weeks, can my boss delay or withhold my unpaid bonuses? I feel like this is not legal. Does anyone know what I can do",
  forum: unpaid_bonus_forum,
  user: users.sample
  )

answer_11 = Answer.create!(
  content: "Your boss can not legally delay or withold your unpaid bonuses because of your resignation.",
  user: lawyers[2],
  question: question_11
)

# UNPAID HOURS

question_12= Question.create!(
  title: "Need advice on claiming unpaid hours at work",
  content: "Hi, it turns out my workplace has not paid me for roughly about 24hours of work throughout the year. I had not realized this as it's a few hours here and there, but it all adds up. They are claiming that any unclaimed hours had to be claimed back within a month, but this is a lot of money to someone like me. It's minimum wage work so I don't always have a lot of money anyway.
  The clock in machine is broken and this has been acknowledged by managers. Yet they've kept a record of hours I've been owed and just not informed me. Is there a time limit for me to claim my unpaid hours. Thanks for your help.",
  forum: unpaid_hours_forum,
  user: users.sample
)

answer_12 = Answer.create!(
  content: "According to the law you have up to 3 months to claim your unpaid hours, so you still have time, and it is illegal for your employers to withold that payment. ",
  user: lawyers[3],
  question: question_12
)

question_13 = Question.create!(
  title: 'Required at work but not paid',
  content: 'My boss is about to require three of five workers at a time to stay off the clock while we’re at work unless we’re absolutely needed. Is this legal?',
  forum: unpaid_hours_forum,
  user: users.sample
)

answer_13 = Answer.create!(
  content: "That practice is absolutely ilegal, if you are forced to remain on your workplace, available to when you are needed, you should be on the clock. ",
  user: lawyers[0],
  question: question_13
)

question_14 = Question.create!(
  title: "unpaid mediatory meeting",
  content: "I have been working at this company for 6 months, and the company stated that all employees must attend these meetings. The thing is, these meetings are three hours long, but they wont be paying us for those hours. Can my employer terminate me for not attending an unpaid, after-hours, mandatory meeting?",
  forum: unpaid_hours_forum,
  user: users.sample
  )

answer_14 = Answer.create!(
  content: "Your employer can not legally force you to attend to a meeting that it is not payed, if you are forced to go you should be paid for it. ",
  user: lawyers[1],
  question: question_14
)
puts "seeding ends"
