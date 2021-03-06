PRAGMA foreign_keys = ON;

CREATE TABLE posts (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    date DATE NOT NULL,
    title VARCHAR(255) NOT NULL,
    subtitle VARCHAR(1024) NOT NULL,
    content TEXT NOT NULL
);

CREATE TABLE pages (
    page_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(32) NOT NULL
);

INSERT INTO pages (page_id, name) VALUES (1, "Home");
INSERT INTO pages (page_id, name) VALUES (2, "Blog");
INSERT INTO pages (page_id, name) VALUES (3, "Resume");

CREATE TABLE texts (
    text_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    page INTEGER NOT NULL,
    description VARCHAR(64) NOT NULL,
    content TEXT NOT NULL,
    FOREIGN KEY(page) REFERENCES pages(page_id)
);

INSERT INTO texts (page, description, content)
VALUES (
    3,
    "resume_body",
    '<h1>Alexander Gio Veltman</h1>
<h2>Details</h2>
<p><strong>Cell:</strong> +27 76 403 7972</p>
<p><strong>Email:</strong> <a href="mailto:alexveltman@protonmail.com">alexveltman@protonmail.com</a></p>
<p><strong>Website:</strong> www.alexveltman.com</p>
<hr />
<h2>General</h2>
<p><strong>Age:</strong> 21</p>
<p><strong>Gender:</strong> Male</p>
<p><strong>Nationality</strong> South African and English</p>
<p><strong>Home Language:</strong> English</p>
<hr />
<h2>Education</h2>
<h3>University of Cape Town, Cape Town, South Africa</h3>
<h4>Bachelor of Science in Physics and Mathematics</h4>
<h5><em>Feb 2018 - Present</em></h5>
<ul>
<li>First Year: 84 GPA, Deans Merit List</li>
<li>Second Year: 73 GPA, Deans Merit List</li>
<li>Received Science Entrance Scholarship, Science Faculty Scholarship and A F Farquharson Scholarship</li>
</ul>
<h3>Kearsney College, Durban, South Africa</h3>
<h4>IEB National Senior Certificate</h4>
<h5><em>Feb 2013 - Nov 2018</em></h5>
<ul>
<li>Achieved distinctions for 7 subjects</li>
<li>Placed top 1% of IEB candidates in Mathematics, Physical Science and Information
  Technology</li>
</ul>
<hr />
<h3>University of Cape Town, Cape Town, South Africa</h3>
<h4>Physics Undergraduate Project</h4>
<h5><em>Dec 2019 - Jan 2020</em></h5>
<ul>
<li>Performed data analysis with the UCT-ATLAS group</li>
<li>Work was performed to improve our current measurement of the top quark</li>
<li>Gained skills working with Machine Learning models and specialised particle physics software</li>
</ul>
<h4>First Year Computer Science Tutor</h4>
<h5><em>Feb 2019 - Nov 2019</em></h5>
<ul>
<li>Assisted the course convener and teaching assistants</li>
<li>Helped students during weekly tutorial sessions</li>
<li>Marked and invigilated written and practical test</li>
</ul>
<h3>FullStack, Cape Town, South Africa</h3>
<h4>Testing Intern</h4>
<h5><em>Jan 2018</em></h5>
<ul>
<li>Reported and documented new bugs and issues</li>
<li>Completed unit test cases</li>
</ul>
<hr />
<h2>Extras</h2>
<h3>University of Cape Town, Cape Town, South Africa</h3>
<h4>Society of Physics Students Committee President</h4>
<h5><em>Feb 2019 - Present</em></h5>
<ul>
<li>Assisted in organising talks and seminars</li>
</ul>
<h3>Kwantebeni Comprehensive High School</h3>
<h4>Mathematics Tutor</h4>
<h5><em>Jan 2017 - Sep 2017</em></h5>
<ul>
<li>Assisted juniors with new mathematics material in hourly sessions</li>
<li>Part of Kearsney Colleges outreach program</li>
</ul>
<hr />
<h2>Computational skills</h2>
<h3>Proficient</h3>
<ul>
<li>
<p>Python</p>
<ul>
<li>Experience from Computer Science courses and Physics labs</li>
<li>Commonly use Matplotlib and Numpy packages</li>
<li>Familiar with data science and machine learning packages like pandas, scikit-learn and pyTorch</li>
<li>Familiar with Flask web framework</li>
</ul>
</li>
<li>
<p>Java</p>
<ul>
<li>Experience from Computer Science courses and High school classes</li>
<li>Familiar with using Java within android app development</li>
</ul>
</li>
<li>
<p>LaTex</p>
<ul>
<li>Written most university reports and assignments using LaTex</li>
</ul>
</li>
<li>
<p>Git</p>
<ul>
<li>Learnt during Computer Science courses</li>
<li>Commonly used for university and personal projects</li>
</ul>
</li>
</ul>
<h3>Familiar</h3>
<ul>
<li>
<p>C/C++ family</p>
</li>
<li>
<p>React/Web Development Suite</p>
<ul>
<li>Created <a href="https://github.com/codecalec/PersonalWebsiteReact">my own website</a> using React library</li>
<li>Learnt from self study and online research</li>
</ul>
</li>
<li>
<p>Julia</p>
</li>
</ul>'
);

