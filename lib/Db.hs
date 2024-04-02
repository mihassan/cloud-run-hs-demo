{-# LANGUAGE OverloadedStrings #-}

module Db (quotes) where

import Quote

quotes :: [Quote]
quotes =
  [ Quote {author = "Michelangelo", quote = "The true work of art is but a shadow of the divine perfection.", category = "art"},
    Quote {author = "Leonardo da Vinci", quote = "Simplicity is the ultimate sophistication.", category = "art"},
    Quote {author = "Pablo Picasso", quote = "Every child is an artist. The problem is how to remain an artist once he grows up.", category = "art"},
    Quote {author = "Vincent Van Gogh", quote = "I would rather die of passion than of boredom.", category = "art"},
    Quote {author = "Herodotus", quote = "Of all possessions a friend is the most precious.", category = "friendship"},
    Quote {author = "Elbert Hubbard", quote = "A friend is someone who knows all about you and still loves you.", category = "friendship"},
    Quote {author = "Oscar Wilde", quote = "True friends stab you in the front.", category = "friendship"},
    Quote {author = "George Bernard Shaw", quote = "Life isn't about finding yourself. Life is about creating yourself.", category = "life"},
    Quote {author = "Albert Einstein", quote = "Life is like riding a bicycle. To keep your balance you must keep moving.", category = "life"},
    Quote {author = "Paulo Coelho", quote = "One is loved because one is loved. No reason is needed for loving.", category = "love"},
    Quote {author = "Mother Teresa", quote = "Spread love everywhere you go. Let no one ever come to you without leaving happier.", category = "love"},
    Quote {author = "William Shakespeare", quote = "Love all, trust a few, do wrong to none.", category = "love"},
    Quote {author = "Maya Angelou", quote = "I've learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel.", category = "love"},
    Quote {author = "Mark Twain", quote = "All you need in this life is ignorance and confidence, and then success is sure.", category = "success"},
    Quote {author = "Winston Churchill", quote = "Success is not final, failure is not fatal: It is the courage to continue that counts.", category = "success"},
    Quote {author = "Albert Schweitzer", quote = "Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful.", category = "success"},
    Quote {author = "Zig Ziglar", quote = "Success is not in what you have, but who you are.", category = "success"}
  ]
