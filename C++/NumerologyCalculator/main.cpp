/**
* NumerologyCalculator: Calculates the "name number" for a given name using the "Pythagorean System"
* For more information: https://en.wikipedia.org/wiki/Numerology
* 
* @file main.cpp
* @author Raymond Beaune
* @version 1.0.0
*/

#include <iostream>
#include <map>
#include <string>
#include <sstream>
#include <vector>
#include <algorithm>

/* The unchanging master numerology table */
static const std::map<char, short> numerologyNumberTable =
{
	{'a', 1}, {'b', 2}, {'c', 3}, {'d', 4}, {'e', 5}, {'f', 6}, {'g', 7}, {'h', 8}, {'i', 9},
	{'j', 1}, {'k', 2}, {'l', 3}, {'m', 4}, {'n', 5}, {'o', 6}, {'p', 7}, {'q', 8}, {'r', 9},
	{'s', 1}, {'t', 2}, {'u', 3}, {'v', 4}, {'w', 5}, {'x', 6}, {'y', 7}, {'z', 8}
};

/**
* Compare character for a number
* 
* Takes a char type and compares it to the master
* numerology table to return the number it
* corresponds to (from 1 to 9)
* 
* @param c The char that will be compared
* @return num that relates to the character, or 0 if there is no match
*/
short CompareCharForNumber(char c)
{
	// Make char variable lowercase for accurate compare
	c = tolower(c);

	// Iterate through map to compare the characters
	for (auto const& x : numerologyNumberTable)
	{
		// If the character has a match in the map, return the number
		if (c == x.first)
		{
			return x.second;
		}
	}

	// Return zero if, for some reason, there was no match at all
	return 0;
}

/**
* Calculate a number from a string
* 
* Takes a string type and loops through each char
* and adds whatever number is returned from the
* CompareCharForNumber() function to an accumulator
* 
* @param string String to evaluate
* @return accumulator The total number accumulated from comparing
*/
short CalculateNumberFromName(std::string& name)
{
	short accumulator = 0;

	// Compare each character in the string
	for (char const& c : name)
	{
		// Add to the accumulator the number that is returned for each letter
		accumulator += CompareCharForNumber(c);
	}

	// Return the total amount that was in the string
	return accumulator;
}

/**
* Calculate the name number
* 
* Calculates the actual number from a total number
* that should be either from 1 to 9 or a "power number"
* which is either 11, 22, or 33
* 
* @param short The number to calculate
* @return num The number to return after calculating
*/
short CalculateNameNumber(short& num)
{
	// If the number is a "power" number, just return that instead
	if (num == 11 || num == 22 || num == 33)
		return num;

	// Mod the number by 9
	num = num % 9;

	// A modded number of 0 is equivalent to 9
	if (num == 0)
		return 9;

	// Return it
	return num;
}

int main()
{
	// Set up from useful variables
	short nameNumber = 0;
	std::string nameString = "";
	std::vector<std::string> vectorNames;
	std::vector<short> vectorNameNumbers;

	std::cout << "What is your full name? (Letters and spaces only)" << std::endl;

	// Get valid name processing
	while (true)
	{
		bool validInput = true; // Validity bool

		// Get input
		std::cout << "> ";
		std::getline(std::cin, nameString);

		// Check name string for any other character besides letters and spaces
		for (char const& c : nameString)
		{
			if (!isalpha(c) && c != ' ')
			{
				validInput = false;
				break;
			}
		}

		if (validInput)
		{
			// Break from while loop
			break;
		}
		else
		{
			std::cout << "> Entry was not valid. Please try again.\n";
			std::cout << std::endl; // Add another line
			nameString = ""; // Clear nameString to be re-used
		}
	}

	// After getting a valid name, create a vector of strings to hold each individual name
	std::string name;
	std::stringstream ss(nameString);
	while (ss >> name)
	{
		vectorNames.push_back(name);
	}
	vectorNames.shrink_to_fit();
	vectorNameNumbers.resize(vectorNames.size());

	// First, calculate the number for each name
	for (std::string s : vectorNames)
	{
		vectorNameNumbers.push_back(CalculateNumberFromName(s));
	}

	// Add all the name numbers together
	for (short n : vectorNameNumbers)
	{
		nameNumber += n;
	}

	// Output results
	std::cout << "> " << nameString << "'s NAME NUMBER is ** " << CalculateNameNumber(nameNumber) << " **" << std::endl;
}