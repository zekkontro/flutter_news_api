
# Flutter News API

#### Flutter News API is the dart api of the https://newsapi.org/ site.

![](https://github.com/zekkontro/flutter_news_api/blob/main/doc/Ads%C4%B1z.png?raw=true)

## -Features-
- Get Articles by query
- Get Arcticles by query and sources
- Get all sources
- Get articles top-headliness

## -Example Code-

Get Top Articles

	 List<Article> articles =  await newsService.getArticlesTopHeadlines(
		apiKey:  "<API-KEY>",
		category:  Category.business,
		countryCode:  "us",
		query:  "flutter",
		sortBy:  SortBy.popularity,
	);

Get everything article by query

    List<Article> articleList =  await newsService.getArticlesByQuery(
		apiKey:  "<API-KEY>",
		query:  "",
		from:  DateTime.now(),
		to:  DateTime.now(),
		sortBy:  SortBy.popularity,
		languageCode:  "en");

Get top articles by source id
	

    List<Article> articleList2 =
	await newsService.getArticlesTopHeadlinesBySources(
	apiKey:  "<API-KEY>",
	category:  Category.general,
	countryCode:  "us",
	sources:  "bbc-news",
	);

Get all news source

    List<Sources> sources =  await newsService.getAllSources(
	    apiKey:  "<API-KEY>",
	    category:  Category.general,
	    language:  "en",
	    countryCode:  "us");


## LICENSE
MIT License

Copyright (c) 2021 Berat Kurt

Permission is hereby granted, free of charge, to any person obtaining a copy

of this software and associated documentation files (the "Software"), to deal

in the Software without restriction, including without limitation the rights

to use, copy, modify, merge, publish, distribute, sublicense, and/or sell

copies of the Software, and to permit persons to whom the Software is

furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all

copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR

IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,

FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE

AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER

LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,

OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE

SOFTWARE.
