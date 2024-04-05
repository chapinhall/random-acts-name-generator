# Install packages if not already installed
packages_list <- c("shiny", "stringr", "glue", "devtools", "emo")
for (p in packages_list) {
  if (!p %in% installed.packages()[, "Package"]) install.package(p)
  if (p == "emo") {
    devtools::install_github("hadley/emo")
  } else {
    library(p, character.only = TRUE)  
  }
}

roster <- read.csv("Chapin Hall Staff Directory -- 2024-04-04.csv")
names <- str_replace(roster[, 1], "(.+), (.+)", "\\2 \\1")

ui <- fluidPage(

    # Application title
    titlePanel(paste0("Chapin Hall - Random Acts of Kindness Name Generator  ", 
                      emo::ji("grinning_face_with_smiling_eyes"),
                      emo::ji("party_popper"),
                      emo::ji("folded_hands"),
                      emo::ji("cowboy_hat_face"),
                      emo::ji("smiling_face_with_sunglasses"),
                      emo::ji("sunflower"))),

    sidebarLayout(
        sidebarPanel(
            actionButton("button", "I'm ready to make someone's day!", style = "font-size:16pt")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            HTML("<BR>"),
            span(textOutput("my_name"), style = "font-size:20pt; margin-top:1cm"),
            htmlOutput("suggestions", style = "font-size:14pt")
        )
    )
)


server <- function(input, output) {

    observeEvent(input$button, {
        
        name_draw <- names[sample(1:length(names), 1)]
        output$my_name <- 
            renderText({
                glue("You've drawn {name_draw} to offer a random act of kindness!")
            })
        output$suggestions <-
            renderText(paste0("<br>Here are some ideas for you to consider!<br>",
                              "<ul>
                                 <li><b>Compliment:</b> give positive feedback on work or contribution</li>
                                 <li><b>Inspire:</b> send an inspiring idea, song, or quote</li>
                                 <li><b>Entertain:</b> pass on a funny meme</li>
                                 <li><b>Help:</b> share a useful tool, website, or app</li>
                                 <li><b>Intrigue:</b> forward an interesting or entertaining bit of trivia</li>
                                 <li><b>Comfort/Reassure:</b> offer a lifehack tip or words of encouragement</li>
                              </ul>"))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
