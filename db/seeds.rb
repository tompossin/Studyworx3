# encoding: utf-8
# Autogenerated by the db:seed:dump task
# Do not hesitate to tweak this to your needs

Blog.create([
  { :user_id => 1, :category => "Howto", :topic => "Getting Mercury Going What about now?", :excerpt => "Whatever", :article => "<b>This is the story of getting mercury going.&nbsp;</b><div><br><div>So far... No love. minor edit.</div><div><ol><li>Many nice points - this is one.</li><li>This is another one.</li></ol></div><div><br></div><div>Maybe soon I will have a powerful editor that I can invoke from anywhere and it will be awesome and cool and newish.&nbsp;</div><div>Then I will be a real HTML 5 kinda guy.&nbsp;</div><div><b>Here's hoping!</b>\n\n</div><div><br></div><div><b>{:&gt;</b> Tom</div>\n</div>", :created_at => "2012-10-27 13:11:37", :updated_at => "2012-11-06 23:04:37", :featured => true, :leadstory => false, :navbar => true },
  { :user_id => 1, :category => "Development what", :topic => "First Thoughts so", :excerpt => nil, :article => "<h4>Here we go building out StudyWorx 3!</h4><h3></h3><div>I love it I think.</div><div>Pretty sweet.</div><div><ul><li>Here's a point</li><li>And another</li><ul><li>A&nbsp;sub-point.</li><li>Now we are cooking.</li></ul></ul><div>Love it.</div></div><div><br></div>", :created_at => "2012-10-27 17:50:35", :updated_at => "2012-11-06 22:31:10", :featured => false, :leadstory => false, :navbar => false },
  { :user_id => 1, :category => "Getting Started", :topic => "Creating a New School", :excerpt => nil, :article => "<h2>Creating a School</h2><div><blockquote><div>Before you begin you will need to be at least a level 1 Administrator.</div><div>If you do not know what that means you will need to contact the site administator here.</div><div>Once you have been promoted to a site administrator you should then have a new entry in your profile menu.</div><div>Click on the link called \"School Administration\".</div><div><br></div><div><br></div><div>Enjoy!</div><div>{:&gt; Tom Possin</div></blockquote></div>", :created_at => "2012-11-06 23:08:20", :updated_at => "2012-11-08 22:19:53", :featured => nil, :leadstory => false, :navbar => true },
  { :user_id => 1, :category => "Getting Started", :topic => "Welcome to Studyworx 3!", :excerpt => nil, :article => "<h4>What is Studyworx?</h4><h5></h5><h4></h4><h3></h3><div><blockquote><div><span class=\"title\">Studyworx</span> is a comprehensive online study environment. It contains everything you need to run anything from an online self-study seminar to a full school with multiple staff in multiple roles. Initially Studyworx was created to be the framework for an online inductive Bible study course, but over time it's features became very complete, until with this version it can rightfully called a full feature e-learning environment.</div><div><br></div><div><i>Here is another thing</i>.</div><div></div><div><br></div><div>Studyworx is a comprehensive online study environment. It contains everything you need to run anything from an online self-study seminar to a full school&nbsp;with multiple staff in multiple roles. Initially Studyworx was created to be the framework for an online inductive Bible study course, but over time it's features became very complete, until with this version it can rightfully called a full feature e-learning environment.<br></div><div><br></div><div>Hello</div><div><br></div><div>Studyworx is a comprehensive online study environment. It contains everything you need to run anything from an online self-study seminar to a full school&nbsp;with multiple staff in multiple roles. Initially Studyworx was created to be the framework for an online inductive Bible study course, but over time it's features became very complete, until with this version it can rightfully called a full feature e-learning environment.<br></div><div><br></div><div>Studyworx is a comprehensive online study environment. It contains everything you need to run anything from an online self-study seminar to a full school&nbsp;with multiple staff in multiple roles. Initially Studyworx was created to be the framework for an online inductive Bible study course, but over time it's features became very complete, until with this version it can rightfully called a full feature e-learning environment.<br></div><div><br></div><div>Studyworx is a comprehensive online study environment. It contains everything you need to run anything from an online self-study seminar to a full school&nbsp;with multiple staff in multiple roles. Initially Studyworx was created to be the framework for an online inductive Bible study course, but over time it's features became very complete, until with this version it can rightfully called a full feature e-learning environment.<br></div><div><br></div><div>Studyworx is a comprehensive online study environment. It contains everything you need to run anything from an online self-study seminar to a full school&nbsp;with multiple staff in multiple roles. Initially Studyworx was created to be the framework for an online inductive Bible study course, but over time it's features became very complete, until with this version it can rightfully called a full feature e-learning environment.<br></div><div><br></div><div>Studyworx is a comprehensive online study environment. It contains everything you need to run anything from an online self-study seminar to a full school&nbsp;with multiple staff in multiple roles. Initially Studyworx was created to be the framework for an online inductive Bible study course, but over time it's features became very complete, until with this version it can rightfully called a full feature e-learning environment.<br></div><div><br></div><div><br></div></blockquote>{:&gt; Tom Possin</div>", :created_at => "2012-11-10 15:00:19", :updated_at => "2012-11-15 02:45:14", :featured => nil, :leadstory => true, :navbar => nil }
], :without_protection => true )



Member.create([
  { :user_id => nil, :member_id => nil, :created_at => nil, :updated_at => nil }
], :without_protection => true )



Mercury::Image.create([
  { :image_file_name => "tomp.jpg", :image_content_type => "image/jpeg", :image_file_size => 97303, :image_updated_at => "2012-11-11 02:23:32", :created_at => "2012-11-11 02:23:32", :updated_at => "2012-11-11 02:23:32", :user_id => 1 },
  { :image_file_name => "stafftraining.jpg", :image_content_type => "image/jpeg", :image_file_size => 147108, :image_updated_at => "2012-11-11 02:42:24", :created_at => "2012-11-11 02:42:24", :updated_at => "2012-11-11 02:42:24", :user_id => 1 },
  { :image_file_name => "me-seminar.jpg", :image_content_type => "image/jpeg", :image_file_size => 40813, :image_updated_at => "2012-11-11 02:46:24", :created_at => "2012-11-11 02:46:24", :updated_at => "2012-11-11 02:46:24", :user_id => 1 },
  { :image_file_name => "bible-and-candle.jpg", :image_content_type => "image/jpeg", :image_file_size => 199539, :image_updated_at => "2012-11-12 00:33:58", :created_at => "2012-11-12 00:34:00", :updated_at => "2012-11-12 00:34:00", :user_id => 0 },
  { :image_file_name => "Butterfly.jpg", :image_content_type => "image/jpeg", :image_file_size => 360944, :image_updated_at => "2012-11-12 00:34:07", :created_at => "2012-11-12 00:34:08", :updated_at => "2012-11-12 00:34:08", :user_id => 0 },
  { :image_file_name => "birds.jpg", :image_content_type => "image/jpeg", :image_file_size => 546647, :image_updated_at => "2012-11-12 00:34:13", :created_at => "2012-11-12 00:34:14", :updated_at => "2012-11-12 00:34:14", :user_id => 0 },
  { :image_file_name => "beautiful-music.jpg", :image_content_type => "image/jpeg", :image_file_size => 103857, :image_updated_at => "2012-11-12 00:34:19", :created_at => "2012-11-12 00:34:19", :updated_at => "2012-11-12 00:34:19", :user_id => 0 },
  { :image_file_name => "lamppost_in_winter.jpg", :image_content_type => "image/jpeg", :image_file_size => 693210, :image_updated_at => "2012-11-12 00:34:36", :created_at => "2012-11-12 00:34:36", :updated_at => "2012-11-12 00:34:36", :user_id => 0 },
  { :image_file_name => "mission_mountains.jpg", :image_content_type => "image/jpeg", :image_file_size => 787791, :image_updated_at => "2012-11-12 00:34:46", :created_at => "2012-11-12 00:34:47", :updated_at => "2012-11-12 00:34:47", :user_id => 0 },
  { :image_file_name => "MistyMorning.jpg", :image_content_type => "image/jpeg", :image_file_size => 629140, :image_updated_at => "2012-11-12 00:34:53", :created_at => "2012-11-12 00:34:53", :updated_at => "2012-11-12 00:34:53", :user_id => 0 },
  { :image_file_name => "natural-doodle.jpg", :image_content_type => "image/jpeg", :image_file_size => 639745, :image_updated_at => "2012-11-12 00:34:58", :created_at => "2012-11-12 00:34:59", :updated_at => "2012-11-12 00:34:59", :user_id => 0 },
  { :image_file_name => "night.jpg", :image_content_type => "image/jpeg", :image_file_size => 436384, :image_updated_at => "2012-11-12 00:35:04", :created_at => "2012-11-12 00:35:04", :updated_at => "2012-11-12 00:35:04", :user_id => 0 },
  { :image_file_name => "norway.jpg", :image_content_type => "image/jpeg", :image_file_size => 302227, :image_updated_at => "2012-11-12 00:35:08", :created_at => "2012-11-12 00:35:08", :updated_at => "2012-11-12 00:35:08", :user_id => 0 },
  { :image_file_name => "pagoda.png", :image_content_type => "image/png", :image_file_size => 1589812, :image_updated_at => "2012-11-12 00:35:13", :created_at => "2012-11-12 00:35:14", :updated_at => "2012-11-12 00:35:14", :user_id => 0 },
  { :image_file_name => "nature.jpg", :image_content_type => "image/jpeg", :image_file_size => 297428, :image_updated_at => "2012-11-12 00:35:40", :created_at => "2012-11-12 00:35:41", :updated_at => "2012-11-12 00:35:41", :user_id => 0 },
  { :image_file_name => "RadioactiveSunrise.jpg", :image_content_type => "image/jpeg", :image_file_size => 702084, :image_updated_at => "2012-11-12 00:35:50", :created_at => "2012-11-12 00:35:51", :updated_at => "2012-11-12 00:35:51", :user_id => 0 },
  { :image_file_name => "Rainy-evening.jpg", :image_content_type => "image/jpeg", :image_file_size => 235835, :image_updated_at => "2012-11-12 00:35:55", :created_at => "2012-11-12 00:35:55", :updated_at => "2012-11-12 00:35:55", :user_id => 0 },
  { :image_file_name => "stilllife.jpg", :image_content_type => "image/jpeg", :image_file_size => 222066, :image_updated_at => "2012-11-12 00:36:07", :created_at => "2012-11-12 00:36:07", :updated_at => "2012-11-12 00:36:07", :user_id => 0 },
  { :image_file_name => "stoner_in_winter.jpg", :image_content_type => "image/jpeg", :image_file_size => 678753, :image_updated_at => "2012-11-12 00:36:12", :created_at => "2012-11-12 00:36:12", :updated_at => "2012-11-12 00:36:12", :user_id => 0 },
  { :image_file_name => "storm.jpg", :image_content_type => "image/jpeg", :image_file_size => 265813, :image_updated_at => "2012-11-12 00:36:16", :created_at => "2012-11-12 00:36:16", :updated_at => "2012-11-12 00:36:16", :user_id => 0 },
  { :image_file_name => "tacked_paper.jpg", :image_content_type => "image/jpeg", :image_file_size => 272516, :image_updated_at => "2012-11-12 00:36:20", :created_at => "2012-11-12 00:36:20", :updated_at => "2012-11-12 00:36:20", :user_id => 0 },
  { :image_file_name => "trees.jpg", :image_content_type => "image/jpeg", :image_file_size => 1362339, :image_updated_at => "2012-11-12 00:36:47", :created_at => "2012-11-12 00:36:47", :updated_at => "2012-11-12 00:36:47", :user_id => 0 },
  { :image_file_name => "natureBW.jpg", :image_content_type => "image/jpeg", :image_file_size => 810925, :image_updated_at => "2012-11-12 03:37:13", :created_at => "2012-11-12 03:37:13", :updated_at => "2012-11-12 03:37:24", :user_id => 0 },
  { :image_file_name => "BusterBigtime.jpg", :image_content_type => "image/jpeg", :image_file_size => 292543, :image_updated_at => "2012-11-12 03:38:55", :created_at => "2012-11-12 03:38:55", :updated_at => "2012-11-12 03:38:55", :user_id => 2 },
  { :image_file_name => "Philadelphia.jpg", :image_content_type => "image/jpeg", :image_file_size => 362180, :image_updated_at => "2012-11-12 04:01:06", :created_at => "2012-11-12 04:01:07", :updated_at => "2012-11-12 04:02:35", :user_id => 0 },
  { :image_file_name => "GLACIERPARK_ST_MARY_SLAKE.JPG", :image_content_type => "image/jpeg", :image_file_size => 89694, :image_updated_at => "2012-11-12 04:04:30", :created_at => "2012-11-12 04:04:30", :updated_at => "2012-11-12 04:04:47", :user_id => 0 },
  { :image_file_name => "Glacier_National_Park_(16).jpg", :image_content_type => "image/jpeg", :image_file_size => 186675, :image_updated_at => "2012-11-12 04:06:27", :created_at => "2012-11-12 04:06:27", :updated_at => "2012-11-12 04:06:45", :user_id => 0 },
  { :image_file_name => "Glacier_National_Park_27.jpg", :image_content_type => "image/jpeg", :image_file_size => 138140, :image_updated_at => "2012-11-12 04:08:58", :created_at => "2012-11-12 04:08:59", :updated_at => "2012-11-12 04:09:26", :user_id => 0 },
  { :image_file_name => "FelserBurg1024.jpg", :image_content_type => "image/jpeg", :image_file_size => 213832, :image_updated_at => "2012-11-12 04:13:01", :created_at => "2012-11-12 04:13:01", :updated_at => "2012-11-12 04:14:25", :user_id => 0 },
  { :image_file_name => "Larochette1024.jpg", :image_content_type => "image/jpeg", :image_file_size => 262147, :image_updated_at => "2012-11-12 04:13:16", :created_at => "2012-11-12 04:13:16", :updated_at => "2012-11-12 04:14:26", :user_id => 0 },
  { :image_file_name => "100_1569.JPG", :image_content_type => "image/jpeg", :image_file_size => 650718, :image_updated_at => "2012-11-15 03:01:54", :created_at => "2012-11-15 03:01:54", :updated_at => "2012-11-15 03:01:54", :user_id => 1 }
], :without_protection => true )



Message.create([
  { :parent_id => nil, :sender_id => nil, :recipient_id => nil, :school_id => nil, :has_read => nil, :archived => nil, :sender_trashed => nil, :recipient_trashed => nil, :subject => nil, :body => nil, :created_at => nil, :updated_at => nil }
], :without_protection => true )



Note.create([
  { :user_id => 1, :reminder => "Another day!", :public => nil, :created_at => "2012-11-17 02:08:02", :updated_at => "2012-11-24 15:32:47" },
  { :user_id => 2, :reminder => "Well I guess this is something but I am not sure what.\r\nAnd this is a bit more.\r\n* Yep\r\n** yep yep", :public => nil, :created_at => "2012-11-17 04:03:59", :updated_at => "2012-11-17 04:10:17" }
], :without_protection => true )



Paper.create([
  { :user_id => nil, :title => nil, :synopsis => nil, :body => nil, :published => nil, :created_at => nil, :updated_at => nil }
], :without_protection => true )



Participant.create([
  { :user_id => 1, :role_id => 1, :school_id => 3, :language_id => 1, :prereq => true, :accepted => 1, :created_at => "2012-11-03 01:11:58", :updated_at => "2012-11-03 01:11:58" },
  { :user_id => 1, :role_id => 1, :school_id => 4, :language_id => 1, :prereq => true, :accepted => 1, :created_at => "2012-11-03 01:11:58", :updated_at => "2012-11-03 01:11:58" }
], :without_protection => true )



Review.create([
  { :paper_id => nil, :user_id => nil, :content => nil, :approved => false, :created_at => nil, :updated_at => nil }
], :without_protection => true )



Role.create([
  { :rolename => "leader", :created_at => "2012-02-11 00:00:00", :updated_at => "2012-02-11 00:00:00" },
  { :rolename => "assistant", :created_at => "2012-02-11 00:00:00", :updated_at => "2012-02-11 00:00:00" },
  { :rolename => "staff", :created_at => "2012-02-11 00:00:00", :updated_at => "2012-02-11 00:00:00" },
  { :rolename => "student", :created_at => "2012-02-11 00:00:00", :updated_at => "2012-02-11 00:00:00" }
], :without_protection => true )



School.create([
  { :version_id => 1, :language_id => 1, :name => "Test School", :location => "YWAM - Montana -&nbsp;Lakeside<div>501 Blacktail Rd</div>Lakeside, MT 59922", :prereqs => "Successful DTS", :start_date => "2012-11-03 01:28:00", :end_date => "2013-11-03 01:28:00", :mailing_address => "3 Mission Ln\r\nLakeside, MT\r\n59922", :tagline => "This is an awesome school", :description => "This is the test school.", :enrolement_type => true, :active => true, :timezone => "", :created_at => "2012-11-03 01:30:13", :updated_at => "2012-11-14 17:01:44", :owner_id => 1 },
  { :version_id => 1, :language_id => 1, :name => "Another School", :location => "Here", :prereqs => "Successful DTS", :start_date => "2012-11-03 01:28:00", :end_date => "2013-11-03 01:28:00", :mailing_address => "3 Mission Ln", :tagline => "Nice", :description => "Very nice", :enrolement_type => true, :active => true, :timezone => "", :created_at => "2012-11-03 01:30:13", :updated_at => "2012-11-03 01:30:13", :owner_id => 1 }
], :without_protection => true )



User.create([
  { :email => "tompossin@gmail.com", :encrypted_password => "$2a$10$iEc9AmTFCkOfGJflnKJWxOJLD/V19iuuR9QbF7Q/ItD2IwiaEeLlq", :reset_password_token => nil, :reset_password_sent_at => nil, :remember_created_at => nil, :sign_in_count => 83, :current_sign_in_at => "2012-11-24 15:32:23", :last_sign_in_at => "2012-11-21 15:03:53", :current_sign_in_ip => "127.0.0.1", :last_sign_in_ip => "127.0.0.1", :confirmation_token => nil, :confirmed_at => "2012-11-03 23:55:30", :confirmation_sent_at => "2012-11-03 23:52:23", :unconfirmed_email => nil, :failed_attempts => 0, :unlock_token => nil, :locked_at => nil, :authentication_token => nil, :created_at => "2012-11-03 01:20:02", :updated_at => "2012-11-24 15:32:23", :firstname => "Tom", :lastname => "Possin", :phone => "406-844-1667", :address => "<div>3 Mission Ln</div><div>Lakeside, MT&nbsp;</div><div>59922\n    </div>", :bio => "<div>Working the SBS.</div><div>Looking forward to Christmas!&nbsp;</div><div><br></div>{:&gt; Tom<br><div><div style=\"text-align: left;\"></div><div><div></div>\n      </div>\n      </div>", :reviewboard => true, :avatar => 10, :wallpaper => 87, :theme => nil, :team => false, :owner_id => nil },
  { :email => "tompossin@studyworx.info", :encrypted_password => "$2a$10$VBFjCem.BI59CU7ojq3bgOPjhjqPJhmgekP37Vc796SWz2hBqGWS6", :reset_password_token => nil, :reset_password_sent_at => nil, :remember_created_at => nil, :sign_in_count => 31, :current_sign_in_at => "2012-11-17 18:06:00", :last_sign_in_at => "2012-11-17 04:03:42", :current_sign_in_ip => "127.0.0.1", :last_sign_in_ip => "127.0.0.1", :confirmation_token => nil, :confirmed_at => "2012-11-04 00:12:38", :confirmation_sent_at => "2012-11-04 00:12:03", :unconfirmed_email => nil, :failed_attempts => 0, :unlock_token => nil, :locked_at => nil, :authentication_token => nil, :created_at => "2012-11-03 01:20:52", :updated_at => "2012-11-17 18:06:00", :firstname => "Buster", :lastname => "Bigtime", :phone => "", :address => "Here\nLakeside, MT", :bio => "He is handsom. That's for sure.", :reviewboard => nil, :avatar => 64, :wallpaper => 54, :theme => nil, :team => false, :owner_id => nil },
  { :email => "1student@localhost.com", :encrypted_password => "$2a$10$2wqB.gnT8OfxBf9UFl7mSO4SOpCbEmxc7yMOP88LJAX6ecWiTtDpC", :reset_password_token => nil, :reset_password_sent_at => nil, :remember_created_at => nil, :sign_in_count => 1, :current_sign_in_at => "2012-11-24 15:38:36", :last_sign_in_at => "2012-11-24 15:38:36", :current_sign_in_ip => "127.0.0.1", :last_sign_in_ip => "127.0.0.1", :confirmation_token => nil, :confirmed_at => "2012-11-24 15:38:36", :confirmation_sent_at => "2012-11-24 15:37:25", :unconfirmed_email => nil, :failed_attempts => 0, :unlock_token => nil, :locked_at => nil, :authentication_token => nil, :created_at => "2012-11-24 15:37:25", :updated_at => "2012-11-24 15:38:58", :firstname => "Student", :lastname => "One", :phone => "", :address => "Here St.\r\nHere, Now 59999", :bio => nil, :reviewboard => nil, :avatar => 39, :wallpaper => nil, :theme => nil, :team => false, :owner_id => nil },
  { :email => "2student@localhost.com", :encrypted_password => "$2a$10$4rIudwIv2IDu7o/onCUy7u9ibwLT0a2GTOaNwqRcRTKCHfZxkya6a", :reset_password_token => nil, :reset_password_sent_at => nil, :remember_created_at => nil, :sign_in_count => 1, :current_sign_in_at => "2012-11-24 15:40:03", :last_sign_in_at => "2012-11-24 15:40:03", :current_sign_in_ip => "127.0.0.1", :last_sign_in_ip => "127.0.0.1", :confirmation_token => nil, :confirmed_at => "2012-11-24 15:40:02", :confirmation_sent_at => "2012-11-24 15:39:37", :unconfirmed_email => nil, :failed_attempts => 0, :unlock_token => nil, :locked_at => nil, :authentication_token => nil, :created_at => "2012-11-24 15:39:37", :updated_at => "2012-11-24 15:40:13", :firstname => "Student", :lastname => "Two", :phone => "", :address => "", :bio => nil, :reviewboard => nil, :avatar => 46, :wallpaper => nil, :theme => nil, :team => false, :owner_id => nil },
  { :email => "3student@localhost.com", :encrypted_password => "$2a$10$DAHSYo2tPMVjgEqqQmJecOhf6yPerS6azMqITDxCt9FmQKXddGcZi", :reset_password_token => nil, :reset_password_sent_at => nil, :remember_created_at => nil, :sign_in_count => 1, :current_sign_in_at => "2012-11-24 15:41:44", :last_sign_in_at => "2012-11-24 15:41:44", :current_sign_in_ip => "127.0.0.1", :last_sign_in_ip => "127.0.0.1", :confirmation_token => nil, :confirmed_at => "2012-11-24 15:41:44", :confirmation_sent_at => "2012-11-24 15:41:13", :unconfirmed_email => nil, :failed_attempts => 0, :unlock_token => nil, :locked_at => nil, :authentication_token => nil, :created_at => "2012-11-24 15:41:13", :updated_at => "2012-11-24 15:41:57", :firstname => "Student", :lastname => "Three", :phone => "", :address => "", :bio => nil, :reviewboard => nil, :avatar => 40, :wallpaper => nil, :theme => nil, :team => false, :owner_id => nil }
], :without_protection => true )



UserAdmin.create([
  { :user_id => 1, :level => 3, :created_at => "2012-10-25 19:23:02", :updated_at => "2012-10-25 19:23:02" },
  { :user_id => nil, :level => nil, :created_at => "2012-10-25 23:07:56", :updated_at => "2012-10-25 23:07:56" }
], :without_protection => true )


