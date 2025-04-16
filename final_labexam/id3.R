    # Load necessary library
    library(C50)
    
    # Load the dataset
    play_tennis_data <- read.csv("id3.csv")
    
    # Convert categorical columns to factors
    play_tennis_data$Outlook <- factor(play_tennis_data$Outlook, levels = c("Sunny", "Overcast", "Rain"))
    play_tennis_data$Temperature <- factor(play_tennis_data$Temperature, levels = c("Hot", "Mild", "Cool"))
    play_tennis_data$Humidity <- factor(play_tennis_data$Humidity, levels = c("High", "Normal"))
    play_tennis_data$Wind <- factor(play_tennis_data$Wind, levels = c("Weak", "Strong"))
    play_tennis_data$PlayTennis <- factor(play_tennis_data$PlayTennis, levels = c("No", "Yes"))
    
    # Train the decision tree model
    model <- C5.0(PlayTennis ~ Outlook + Temperature + Humidity + Wind, data = play_tennis_data)
    
    # Visualize the decision tree
    plot(model, main = "Decision Tree Visualization",type='simple')
    
    # Get user input
    cat("Enter the following options:\n")
    
    cat("1. Outlook (Sunny, Overcast, Rain): ")
    outlook <- readline()
    
    cat("2. Temperature (Hot, Mild, Cool): ")
    temperature <- readline()
    
    cat("3. Humidity (High, Normal): ")
    humidity <- readline()
    
    cat("4. Wind (Weak, Strong): ")
    wind <- readline()
    
    # Create test data from user input
    test_data <- data.frame(
      Outlook = factor(outlook, levels = c("Sunny", "Overcast", "Rain")),
      Temperature = factor(temperature, levels = c("Hot", "Mild", "Cool")),
      Humidity = factor(humidity, levels = c("High", "Normal")),
      Wind = factor(wind, levels = c("Weak", "Strong"))
    )
    
    # Make prediction
    prediction <- predict(model, newdata=test_data)
    
    # Display prediction
    cat("Predicted Class:", as.character(prediction), "\n")
