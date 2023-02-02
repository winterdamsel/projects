
### App that will throw lists of items that are similar in different cuisines ###########
### App will ask the user if they want to add an item, so it will ask: Name of dish, description, country, and lookalike.
### App will also ask the user if they want to know lookalikes of a certain food (which will list the food items and countries they are from) or lookalikes in a country.

import os

class Food:
    def __init__(self, name, description, country, lookalikes = []):
        self.name = name
        self.description = description
        self.country = country
        self.lookalikes = lookalikes

foods = {}
foods["quesadilla"] = Food("quesadilla", "Folded tortilla, usually with melted cheese inside but can have other stuffings likes mushrooms, chicken, etc.", "Mexico", ["gozleme"])
foods["bunuelos"] = Food("bunuelos", "Thin and crispy circular fried dough with piloncillo syrup.", "Mexico", ["diples"])
foods["gozleme"] = Food("gozleme", "Stuffed turnover made with hand-rolled leaves of yufka dough and diverse fillings.", "Turkey", ["quesadilla"])
foods["diples"] = Food("diples", "Fried dough in the shape of bows or spirals dipped in honey or sugar syrup.", "Greece", ["bunuelos"])
foods["gulabjamun"] = Food("gulab jamun", "Milk solids made into round dough balls that are fried and soaked in rose water, cardamom and sugar syrup.", "India", ["lokma"])
foods["lokma"] = Food("lokma", "Deep fried dough balls, soaked in syrup or honey, sometimes coated with cinnamon or other ingredients", "Greece", ["gulabjamun"])
foods["chilaquiles"] = Food("chilaquiles", "Tortilla chips soaked in salsa, with some sprinkled cheese and may have a protein like a fried egg, chicken, beef, etc.", "Mexico",["paprichat"])
foods["paprichat"] = Food("paprichat", "Crisp fried dough wafers known as papri, along with boiled chick peas, boiled potatoes, dahi (yogurt) and tamarind chutney and topped with chat masala and sev.", "India", ["chilaquiles"])
foods["bahnbohap"] = Food("bahn bo hap", "Chewy sponge rice cake made with a bit of sugar and coconut milk.", "Vietnam", ["idli"])
foods["idli"] = Food("idli", "Savoury rice cake", "India", ["bahnbohap"])
foods["tamales"] = Food("tamales", "Spongy food made out of corn flour dough, filled with stuffing, wrapped in a corn or banana leaf and steamed.", "Mexico", ["bahnchung"])
foods["bahnchung"] = Food("bahn chung","Glutinous rice food, filled with mung beans, pork and other ingredients, wrapped in banana leaves and soaked or steamed.","Vietnam", ["tamales"])
def display_info(foodie):
    print("==========================================================================")
    print(f"Meet {foodie.name.title()}.")
    print(f"Description:\n{foodie.description}")
    print(f"Country of origin: {foodie.country}")
    tmp = ",".join(foodie.lookalikes)
    print(f"Foopelgangers: {tmp}")
    print("==========================================================================")

while True:
    print("==========================================================================\n\n")
    print("      ( ˘▽˘)っ♨________( ・・)つ―{}@{}@{}-_________(っ˘ڡ˘ς)              ")
    print("      F    O    O    P    E    L    G    A    N    G    E    R            ")
    print("\n\n==========================================================================")
    print("Hello there!\nThis is Foopelganger.\nA small program that will let you check which food items might have a doppelganger in another part of the world.\n")
    print("Select one the options below to start:\na) Show lookalikes of a certain food\nb) Show food items from a country\nc) Add new item\nd) Show all items in store")
    option = input("Your selection: ")

    if option == 'a':
        food = input('Which food item should I show you info about? ')
        if food not in foods:
            print("Item not found. Please choose another option.")
            continue
        item = foods[food]
        display_info(item)
    elif option == 'b':
        country = input("Which country do you want to see items from? ")
        locf = []
        for f in foods.values():
            if f.country == country.title():
                locf.append(f.name)
        allfoods = ",".join(locf)

        print(f"\nFoods available for {country}: {allfoods}")
    elif option == "c":
        namf = input("Please type the name of the food item: ")
        descf= input("Now, please provide a description of the food item: ")
        conf = input("Which country is this food from? ")
        lookf = input("Which other food items are doppelgangers?\nPlease put a comma if it's more than one (e.g. torta,sandwich): ")
        newf = Food(namf.strip(), descf.strip(), conf.strip(), lookf.strip().split(","))
        foods["".join(namf.strip())] = newf
        print("New item has been added!!")
        display_info(newf)
    elif option == "d":
        print("These are the food items I have in store:\n")
        for key,fit in foods.items():
            print(f"-{fit.name}")
    else:
        print("That option is not valid. Please try again.")
    os.system("pause")
