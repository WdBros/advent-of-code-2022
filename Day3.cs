using System.IO;

// Part 1 of Day 3
// It's done! :D
class Day3
{

    const string letters = "0abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

    static void Main()
    {
        string[] input = File.ReadAllLines("./input/Day3.txt");
        Task1(input);
        Task2(input);
    }

    static void Task1(string[] input)
    {

        int runningTotal = 0;

        foreach (string line in input)
        {
            string firstHalf = line.Substring(0, line.Length / 2);
            string secondHalf = line.Substring(line.Length / 2, line.Length / 2);

            foreach (char item in firstHalf)
            {
                if (secondHalf.Contains(item))
                {
                    runningTotal += letters.IndexOf(item);
                    break;
                }
            }
        }

        Console.WriteLine("Duplicates (Task 1): " + runningTotal);
    }

    static void Task2(string[] input)
    {
        int runningTotal = 0;
        for (int i = 0; i < input.Length; i+=3)
        {
            string alreadyChecked = "";
            foreach (char letter in input[i])
            {
                if (alreadyChecked.Contains(letter)) continue;
                if (input[i + 1].Contains(letter) && input[i + 2].Contains(letter))
                {
                    runningTotal += letters.IndexOf(letter);
                    break;
                }
                else alreadyChecked += letter;
            }
        }

        Console.WriteLine("Badges (Task 2): " + runningTotal);
    }
}

