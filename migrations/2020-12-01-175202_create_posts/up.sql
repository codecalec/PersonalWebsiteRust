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
    '
<h1 id="alexander-gio-veltman">Alexander Gio Veltman</h1>
<h2 id="details">Details</h2>
<p><strong>Cell:</strong> +27 76 403 7972</p>
<p><strong>Email:</strong> <a href="mailto:alexveltman@protonmail.com">alexveltman@protonmail.com</a></p>
<p><strong>Website: <a href="www.alexveltman.com">www.alexveltman.com</a></p>
<h2 id="general">General</h2>
<p><strong>Nationality</strong> South African and English</p>
<p><strong>Home Language:</strong> English</p>
<h2 id="education">Education</h2>
<h3 id="university-of-cape-town-cape-town-south-africa">University of Cape Town, Cape Town, South Africa</h3>
<h4 id="masters-of-science-in-physics">Masters of Science in Physics</h4>
<h5 id="feb-2022---present"><em>Feb 2022 - Present</em></h5>
<ul>
<li>Topic: A search for single top quark production with an associated W and Z boson</li>
<li>Supervisor: Dr. James Keaveney</li>
</ul>
<h4 id="bachelor-of-science-honours-in-physics">Bachelor of Science Honours in Physics</h4>
<h5 id="feb-2021---nov-2021"><em>Feb 2021 - Nov 2021</em></h5>
<ul>
<li>Achieved First Class finish</li>
<li>Thesis Title: Constraining the Standard Model Effective Field Theory</li>
</ul>
<h4 id="bachelor-of-science-in-physics-and-mathematics">Bachelor of Science in Physics and Mathematics</h4>
<h5 id="feb-2018---dec-2020"><em>Feb 2018 - Dec 2020</em></h5>
<ul>
<li>Achieved Dean’s Merit List for all years of study</li>
<li>Received Science Entrance Scholarship, Science Faculty Scholarship</li>
</ul>
<h3 id="kearsney-college-durban-south-africa">Kearsney College, Durban, South Africa</h3>
<h4 id="ieb-national-senior-certificate">IEB National Senior Certificate</h4>
<h5 id="feb-2013---nov-2018"><em>Feb 2013 - Nov 2018</em></h5>
<ul>
<li>Achieved distinctions for 7 subjects</li>
<li>Placed top 1% of IEB candidates in Mathematics, Physical Science and Information Technology</li>
</ul>
<h2 id="work-experience">Work Experience</h2>
<h3 id="university-of-cape-town-cape-town-south-africa-1">University of Cape Town, Cape Town, South Africa</h3>
<h4 id="physics-lab-tutor">Physics Lab Tutor</h4>
<h5 id="feb-2021---present"><em>Feb 2021 - Present</em></h5>
<ul>
<li>Helped run practical lab and Python computational lab sessions for second year UCT physics students</li>
</ul>
<h4 id="first-year-computer-science-tutor">First Year Computer Science Tutor</h4>
<h5 id="feb-2019---nov-2019"><em>Feb 2019 - Nov 2019</em></h5>
<ul>
<li>Assisted the course convener and teaching assistants</li>
<li>Helped students during weekly tutorial sessions</li>
<li>Marked and invigilated written and practical test</li>
</ul>
<h3 id="fullstack-cape-town-south-africa">FullStack, Cape Town, South Africa</h3>
<h4 id="testing-intern">Testing Intern</h4>
<h5 id="jan-2018"><em>Jan 2018</em></h5>
<ul>
<li>Reported and documented new bugs and issues</li>
<li>Completed unit test cases</li>
</ul>
<h2 id="extras">Extras</h2>
<h3 id="university-of-cape-town-cape-town-south-africa-2">University of Cape Town, Cape Town, South Africa</h3>
<h4 id="society-of-physics-students-committee-president">Society of Physics Students Committee President</h4>
<h5 id="feb-2019---present"><em>Feb 2019 - Present</em></h5>
<ul>
<li>Assisted in organising talks and seminars</li>
</ul>
<h3 id="kwantebeni-comprehensive-high-school">Kwantebeni Comprehensive High School</h3>
<h4 id="mathematics-tutor">Mathematics Tutor</h4>
<h5 id="jan-2017---sep-2017"><em>Jan 2017 - Sep 2017</em></h5>
<ul>
<li>Assisted juniors high school students with new mathematics material in hourly sessions</li>
<li>Part of Kearsney College’s outreach program</li>
</ul>
<h2 id="computationalprogramming-skills">Computational/Programming skills</h2>
<h3 id="proficient">Proficient</h3>
<ul>
<li>Python
<ul>
<li>Commonly used for building analyses and the default choice for small personal projects</li>
<li>Worked with popular data science packages such as pandas, numpy and scipy</li>
</ul></li>
<li>Linux
<ul>
<li>Daily drive Linux systems on my laptop and desktop</li>
<li>Maintain my own Debian virtual private server</li>
<li>Performed much of my university analyses on remote RHEL-based systems</li>
</ul></li>
<li>LaTeX
<ul>
<li>Written most university reports and assignments using LaTeX</li>
</ul></li>
<li>Git
<ul>
<li>Commonly used for university and personal projects</li>
<li>Used within the ATLAS research group for version control between multiple teams</li>
</ul></li>
</ul>
<h3 id="familiar">Familiar</h3>
<ul>
<li>Rust
<ul>
<li>Used for personal projects</li>
<li>Built my personal website using Rust</li>
<li>Developed a CLI based game <a href="https://github.com/codecalec/big-tac-toe">BigTacToe</a></li>
</ul></li>
<li>C/C++
<ul>
<li>Used for building analyses using the <a href="https://root.cern.ch/">ROOT</a> analysis framework</li>
</ul></li>
<li>React/Web Development Suite
<ul>
<li>Created <a href="https://github.com/codecalec/PersonalWebsiteReact">my own website</a> using React library</li>
<li>Learnt from self study and online research</li>
</ul></li>
<li>Java
<ul>
<li>Experience from Computer Science courses and High school classes</li>
<li>Familiar with using Java within android app development</li>
</ul></li>
</ul>
    '
);

