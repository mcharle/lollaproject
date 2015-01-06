lollaproject
============
Use lollaproject to vote for and make comments on your favorite artists performing at Lollapalooza in 2013.
Creation
============
I made lollaproject while shadowing Kunal Bhat at gravitytank in 2013.
First I looked at the source for Lollapalooza's lineup page. I used Nokogiri to get all of the band names from the "data-artist-
name" field and wrote the data to a text file (one artist name per line). I played around with the layout and decided to do
one artist per row.<br>
I then added voting. When a user clicks the "upvote" button, a handler will search a textfile for the band's name and correspond
ing vote count and increase it by 1.<br>
I also thought it would be fun for users to be able to make comments, so I decided to use Disqus. For each artist to have its
own comment thread, I had to make a page for each band.<br>
Check it out at <a href="http://lollaproject.herokuapp.com">lollaproject.herokuapp.com</a>
