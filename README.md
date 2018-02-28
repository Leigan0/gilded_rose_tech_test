# Gilded rose tech test

# Task

Explained below is a tech test challenge I have attempted to solve.

## Approach

My aim is to solve this problem in a test driven approach. As I have been given code to work with my first aim is to understand the code and its specs.

My first step has been to write a test suite for the code in its current state. I have written several feature tests which cover the requirements and include edge cases. I have also included a feature test which covers several scenarios and multiple rules. Having the framework has improved my understanding of the codes purpose.

The tests will also allow me ensure no code is untested when refactoring the code, and provides a model to ensure all the specs are still met. At the moment I have not isolated any tests as this would have increased complexity when my goal will be to refactor the code and add a feature.

As my codebase developed I planned to include unit tests for the classes, which can be isolated. I attempted this with doubles. However, as item cannot be changed as per the brief I am unable to delegate the responsibility of changing the quality state to item. Due to this I have chosen to have a focus on unit / integration tests to confirm my classes do not change the required functionality.  Had I been able to amend the item class, I would have considered adding a method to item to reduce its own quality attribute which would have allowed isolated tests.

My approach has been to locate repeated code and pull this out to methods to reduce the amount of repeated code. I have done this in small tests and repeated tests with each change.

Once I pulled out the code into smaller more managable methods, I have grouped code with similar behaviour. Upon review I have noted two defined behaviours. Increase in quality based on specification, and decreases in quality. I think it would be reasonable to pull out this behaviour into two further classes. With the GildedRose class being responsible for identifying if product increase or decrease, and created new class based on this.

From reviewing the classes I am aware I have had to create specific methods dependant on item name. I have also not been able to test my classes which is an indicator that the classes are too tightly coupled to the item object, and highlights a design flaw. My classes are open to change, and need to be redesigned based on this.

Had I had more time I would change the design of the program, with a view of polymorphism. I would not change the item class but create additional classes specific to each item. This would allow me to call the same method for each item and reduce the need to several repeated code methods within the classes I have.

## Usage
* Clone the repo
* cd to repo
* Bundle
* run in command line
* To run tests - rspec


This is a well known kata developed by [Terry Hughes](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/). This is commonly used as a tech test to assess a candidate's ability to read, refactor and extend legacy code.

Here is the text of the kata:

*"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- “Aged Brie” actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
- “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

* “Conjured” items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."*

## The brief:

Choose [legacy code](https://github.com/emilybache/GildedRose-Refactoring-Kata) (translated by Emily Bache) in the language of your choice. The aim is to practice good design in the language of your choice. Refactor the code in such a way that adding the new "conjured" functionality is easy.

HINT: Test first FTW!
