// Generate nested xml
import nlp from lib_nlp;
Telrec := RECORD
  STRING area;
  STRING prefix;
  STRING station;
  STRING text;
END;
datex := RECORD
  STRING month;
  STRING day;
  STRING year;
  STRING date_normalized;
  STRING text;
END;
links := RECORD
  STRING link;
END;
// links := RECORD
//   DATASET(link) link {XPATH('link')};
// END;

progs := RECORD
   STRING proglang {XPATH('proglang')};
END;
skilltype := RECORD
  STRING text;
END;
comps := RECORD
  STRING companie;
END;
bultype := RECORD
  STRING text;
  DATASET(datex) dates {XPATH('dates') };
  DATASET(links) links {XPATH('links') };
  DATASET (progs) proglangs {XPATH('proglangs') };
END;
gradx := RECORD
  STRING num;
  STRING type;
  STRING text;
  STRING val;
END;
datera := RECORD
  STRING no_of_day;
  STRING no_of_months;
  STRING no_of_years;
END;
dater := RECORD
  DATASET(datex) date {XPATH('date') };
  DATASET(datera) daterange {XPATH('daterange') }
END;
edutype := RECORD
  STRING insitute;
  STRING city;
  DATASET (dater) daterange {XPATH('daterange') };
  DATASET(datex) dates {XPATH('dates') };
  DATASET(gradx) grade {XPATH('grade') };
END;


proset := RECORD
  STRING text;
  DATASET(datex) dates {XPATH('dates') };
  DATASET(links) links {XPATH('links') };
  DATASET (progs) proglangs {XPATH('proglangs') };
  DATASET (dater) daterange {XPATH('daterange') };
END;

article := RECORD
  STRING section;
  STRING name;
  STRING email;
  STRING links;
  DATASET(datex) dates {XPATH('dates') };
  DATASET(Telrec) Telephone {XPATH('Telephone') };
  DATASET (bultype) bullet {XPATH('bullet') };
  DATASET (edutype) education {XPATH('education') };
  DATASET (skilltype) skill {XPATH('skill') };
  DATASET (progs) proglangs {XPATH('proglangs') };
  DATASET (comps) companies {XPATH('companies') };
  DATASET (proset) prose {XPATH('prose') };
  DATASET (dater) dateranges {XPATH('dateranges') };
END;
introduction := RECORD
  STRING section;
  STRING name;
  STRING email;
  DATASET(Telrec) Telephone {XPATH('Telephone') };
  DATASET(links) links {XPATH('links')};
END;
educational := RECORD
  DATASET (edutype) education {XPATH('education') };
END;
projects := RECORD
  DATASET (proset) prose {XPATH('prose') };
  DATASET (bultype) bullet {XPATH('bullet') };
END;

abilities := RECORD
  DATASET (skilltype) skill {XPATH('skill') };
  DATASET (progs) proglangs {XPATH('proglangs') };
END;
resume := RECORD
  DATASET (introduction) introduction {XPATH('introduction')};
  DATASET (educational) educational {XPATH('educational')};
  DATASET (projects) projects {XPATH('projects')};
  DATASET (abilities) abilities {XPATH('abilities')};
  // DATASET (projects) introduction {XPATH('projects')}; 
END;
resumex := RECORD
  DATASET (resume) resume {XPATH('resume')};
  // DATASET (projects) introduction {XPATH('projects')}; 
END;
resumes := DATASET('~resume::resumes::output_fin.xml',resumex,XML('resumes'));
resumes;

// import nlp from lib_nlp;
// resume := RECORD
//   STRING text;
// END;

// resumes := DATASET('~doj::resumes::resume.xml',resume,XML('resume'));
// resumes;

// nlpResults := RECORD
//   STRING xmltext1;
// END;
  
// nlpResults ExtractContent(resume L, INTEGER c) := TRANSFORM
//   SELF.xmltext1 := nlp.AnalyzeText('ResumeAnalyzer_latest-5',L.text);
// END;

// parsedResumes := PROJECT(resumes,ExtractContent(LEFT,COUNTER));
// parsedResumes;

// datex := RECORD
//   STRING month;
//   STRING day;
//   STRING year;
//   STRING date_normalized;
//   STRING text;
// END;

// personRec := RECORD
//   STRING name;
//   STRING email;
//   DATASET(datex) dates ;

// END;

// resumeRec := RECORD
//   DATASET(personRec) person;
//   END;

// resumeRec extractResume(nlpResults L) := TRANSFORM
//   SELF.person := XMLPROJECT('headerZone',
//                             TRANSFORM(personRec,
//                                       SELF.name := XMLTEXT('name'),
//                                       SELF.email := XMLTEXT('email'),
//                                       SELF.dates:= TRANSFORM(
//                                         SELF.month := XMLTEXT('month'),
//                                         SELF.day := XMLTEXT('day'),
//                                       END;)));
//   END;

// out := PARSE(parsedResumes, xmltext1, extractResume(LEFT), XML('resume'));
// out;


// article := RECORD
//   STRING text;
// END;

// articles := DATASET('~doj::resumes::resume.xml',article,XML('resume'));
// articles;

// nlpResults := RECORD
//   STRING xmlEntities;
// END;
  
// nlpResults ExtractEntities(article L) := TRANSFORM
//   SELF.xmlEntities := nlp.AnalyzeText('ResumeAnalyzer_latest-5',L.text);
// END;

// entities := PROJECT(articles,ExtractEntities(LEFT));
// entities;
// I was doing this as I converted the resume text itself into XML for trying out 
// my own stuff but the spaces, \n's and all are removed so I am getting 
// incorrect output. Please let me know what I can do so that I can 
// run the analyzer as it is on the text file.