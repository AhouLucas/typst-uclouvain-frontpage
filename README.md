# UCLouvain frontpage for Typst reports

I made this template for Typst reports for students of **Université Catholique de Louvain**

## Usage

1. Copy `frontpage.typ` and `UCL.png` into your Typst project

2. `main.typ`
    ```rs
    #import "path/to/frontpage.typ": conf

    #show: conf.with(
    lang: "en",
    cours: "LEPL0000 - Insert Course Name",
    subject: "Project - Part 0",
    title: "Insert Title",
    students: (
        (name: "John Doe", noma: 12342200),
        (name: "Jane Doe", noma: 45672200),
    ),
    teachers: (
        (name: "V. Gazou"),
        (name: "J-F. Remaclou"),
        (name: "F. Glinou")
    ),
    heading_numbering: "1.a" // any pattern or none if you don't want to number headings
    )



    = Introduction

    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fermentum, metus vel tempor commodo, nibh felis viverra nunc, sit amet tincidunt lectus quam et ante. Fusce venenatis porta lacinia. Phasellus nibh nibh, pulvinar at iaculis et, commodo in nibh. Morbi vitae condimentum eros. Cras tristique massa vel sollicitudin ullamcorper. Vivamus lacus massa, placerat a nibh vulputate, interdum sollicitudin nunc. Sed interdum purus nec leo ullamcorper, eu blandit neque molestie. Vivamus faucibus iaculis arcu sed facilisis. Mauris vel ipsum faucibus, pellentesque lorem ac, vulputate felis. Vivamus tincidunt est ut risus auctor, sed porta libero ornare. Ut in posuere risus, nec ornare elit. Quisque porta tincidunt risus vitae iaculis. Quisque et ligula condimentum nisl pulvinar vulputate id vitae mi. Suspendisse potenti. 
    ```
3. Enjoy !

## Further customization

You can of course, for example, change the fonts and the page numbering pattern if you are not a fan. When you do, either do your changes directly in the `frontpage.typ` file or if you prefer doing it in your `main.typ` then you should make any change after the frontpage configuration, as they would overwritten otherwise.