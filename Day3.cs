using System.IO;

// Part 1 of Day 3
class Day3
{
    static void Main(string[] args)
    {
        string letters = "abcdefghijklmnopqrstuvwxyz"; letters += letters.ToUpper(); letters = "0" + letters;

        string[] input = File.ReadAllLines("input.txt");

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

        Console.WriteLine("The total is: " + runningTotal);

        Console.ReadKey();
    }
}

