#let conf(
  lang: none,
  cours: none,
  subject: none,
  title: none,
  students: (),
  teachers: (),
  heading_numbering: none,
  doc,
) = {
  // Use Latex's default font
  set text(font: "New Computer Modern", lang: lang)

  // Add a vertical space before and after level 1 section
  show heading.where(level: 1): set block(below: 1em, above: 2em)

  // Set heading numbering
  set heading(numbering: if heading_numbering != none {heading_numbering} else {none})
  
  set page(
    paper: "a4",
    footer: context {
      let p = counter(page).get().first()
      let n = counter(page)

      set align(center)
      
      if p == 0 [
        #datetime.today().display("[month repr:long] [day], [year]")
      ] else {
        counter(page).display(
          "-- 1 of 1 --",
          both: true,
        )
      }
    },
  )
  
  
  // Front page content
  set align(center)
  image("UCL.png", width: 10cm) 
  
  v(2cm)
  text( size: 18pt, smallcaps[UCLouvain] )
  linebreak()
  v(1cm)
  
  text( size: 16pt, cours)
  linebreak()
  v(1em)
  text( size: 14pt, subject)
  linebreak()
  v(1cm)
  
  line(length: 10cm)
  text(weight: "bold", size: 16pt, title)
  linebreak()
  line(length: 10cm)
  
  v(4cm)
  
  set align(center)
  grid(
    columns: (1fr, 1fr, 1fr),
    [
      #set align(left)
      #set par(justify: false)
      #text(weight: "bold", style: "italic", size: 12pt, [
        #if lang == "fr" {
          if students.len() == 1 {
            "Étudiant"
          } else {
            "Étudiants"
          }
        } else {
          if students.len() == 1 {
            "Student"
          } else {
            "Students"
          }
        }
      ]) \
      #students.map(student => [
        #smallcaps[#student.name (#student.noma)]
      ]).join(linebreak())
    ],
    [],
    [
      #set align(right)
      #text(weight: "bold", style: "italic", size: 12pt, [
        #if lang == "fr" {
          if teachers.len() == 1 {
            "Enseignant"
          } else {
            "Enseignants"
          }
        } else {
          if teachers.len() == 1 {
            "Teacher"
          } else {
            "Teachers"
          }
        }
      ]) \
      #teachers.map(teacher => [
        #smallcaps[#teacher.name]
      ]).join(linebreak())
      #v(1cm)
    ]
  )

  // Remove numbering for frontpage
  counter(page).update(0)
  
  // Page break for content
  pagebreak()
  
  // Content starts here (Question 2.1)
  set align(left)
  doc
}

// Example

// #show: conf.with(
//   lang: "en",
//   cours: "LEPL0000 - Insert Course Name",
//   subject: "Project - Part 0",
//   title: "Insert Title",
//   students: (
//     (name: "John Doe", noma: 12342200),
//     (name: "Jane Doe", noma: 45672200),
//   ),
//   teachers: (
//     (name: "V. Gazou"),
//     (name: "J-F. Remaclou"),
//     (name: "F. Glinou")
//   ),
//   heading_numbering: "1.a" // any pattern or none if you don't want to number
// )



// = Introduction