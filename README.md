# Blog

This blog is built with [Jekyll](https://jekyllrb.com/).

The theme builds off
[Type Theme](https://rohanchandra.github.io/project/type/), and is
heavily inspired by [Otoro](http://blog.otoro.net/), the [New York
Times](http://www.nytimes.com/), and the
[Rosenrot](http://the-rosenrot.com/). The annals-like frontpage takes
cue from Paul Graham's [essays](http://paulgraham.com/articles.html)
and Cosma Shalizi's [notebooks](http://bactra.org/notebooks/).

The following Jekyll plugins are used:

+ [KaTeX](https://khan.github.io/KaTeX/), Google Fonts, Google Analytics, Normalize, Pygments (comes with TypeTheme)
+ [Jekyll Scholar](https://github.com/inukshuk/jekyll-scholar)

## Workflow

Here's my workflow for writing and submitting blog posts.

1. Dump thoughts into a markdown file, in `_drafts/`. Or edit the many
   files already inside `_drafts/`. Preview (and generate) the static
   site from a local server.

  ```bash
  jekyll serve --drafts
  ```
2. When complete, rename and move the file to `_posts/`.
3. Re-build the site.

  ```bash
  jekyll build --destination ../blog
  ```
4. Copy generated blog onto my virtual private server, which hosts the blog.

  ```bash
  scp -r ../blog digitalocean:/var/www/dustintran.com
  ```

## Maintenance

To keep the theme up to date, I track the theme's original repo on
the `type-theme` branch. Add to remote the original repo,
```
git remote add theme git@github.com:rohanchandra/type-theme.git
```
Whenever you want to update, simply run
```
git checkout type-theme
git pull theme master
```
You can compare `type-theme` to `master` and possibly merge in any
changes. Keeping the theme up-to-date on a separate branch avoids
treating the repo as a fork: this repo does more than just style
things and is thus not appropriate as a fork.

## Notes

I had to do a hack for in-text citations.
It copies apa, where the only difference is on lines 588-594. The file
is in `etc/`.
Also see [here](https://github.com/inukshuk/jekyll-scholar/issues/33).
```
  <layout suffix=")" delimiter="; ">
    <group delimiter=" ">
      <text macro="author-short"/>
      <text prefix="(" macro="issued-year"/>
      <text macro="citation-locator"/>
    </group>
  </layout>
```

## Setting up Jekyll

Install Ruby and Jekyll. I recently did this for my [Windows
machine](https://jekyllrb.com/docs/installation/windows/).

Go to the blog directory. Run

```ruby
bundle update
```

Add the above hack for in-text citations by including a custom APA
in-text style CSL file. Test your setup now works with `jekyll serve
--drafts`.
