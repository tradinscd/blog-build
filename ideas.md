## misc
+ A Brief Note on the Simulation Hypothesis
+ intro to causality
+ blog post on "Do we have AGI yet?"
+ maybe a tips/tricks for training VAEs post, with released edward code
+ "bayesian inference isn't end-to-end"
+ two-part codes and the ease of finding the best marginal likelihood (on training data): consider a program that memorizes the data. then K(P) = K(x), as E [ log p( x | P) ] = 0. for generalization, we must find the shortest program to do so. in MDL terms, this is the minimum number of bits in the weights
+ "What is artificial general intelligence?"
+ "A Bayesian's view of the simulation hypothesis"
+ "Why be Bayesian?"
  + it's not about uncertainty. it's about occam's razor. shortest program leads to better generalization. provably more likely causality. data efficiency. compression.
+ how research for my openai paper worked
  + chronicle its beginnings from conception to first steps, failure modes, much paper reading/etc. to insights and larger scale stuff
+ updates on experiments blog post
  + i store log/, data/, and out/ in ~ both locally and remotely. i store individual projects repos on Dropbox/ssh or Dropbox/github
  + arxiv mailing list
  + google scholar alerts
  + feedly for blogs
  + internal communication channels within reserach groups/industries
  + my own utilities repo
+ replication crisis, coting even worse than science and p valued

## How to Write a Research Paper

+ acknowledgments inheriting from primarily alp kucukelbir, and also dave blei

technology
+ my meta-writing styles (e.g., \pp, \q, \note, \sidenote)
+ platforms (github+latex, sharelatex, never dropbox)
+ lstlisting and formatting
+ cref
+ bib clean-up and sorting
+ when to keep/clean up comments
+ sections per file (except for sharelatex)
+ how this generally intersects with Resaerch blog post (e.g., etc/; all what i'm talking about belongs to doc/)
+ tikz images
+ tables

writing
+ what to write first, namely how to structure thoughts, and also how above technology helps
+ transitions between sections
+ abstract vs intro
  + intro prefaces topic
  + importantly, present problems and challenges before solutions. formulating problems is extremely underrated and important. before caring about a solution, readers must be first convinced that the problem is important in the first place!
+ general block formats of papers
+ more flexible pieces of papers that are paper-dependent
  + e.g., systems papers vs algorithm papers vs domain-specific papers
  + related work
  + formality, e.g., bluntness vs formal writing
  + technical detail
+ role of discussion (summary, limitations/challenges, future work)
+ things to keep in mind
  + pick general audience of paper. this frames everything. for example, it determines level of technicality and what parts deserve emphasis
  + pick 3 specific people you'd think this paper would be interesting for. what would they find specifically useful?

Some people prefer to write the full paper after major experiments are complete. I personally like to write a paper more as a summary of the current ideas and, as with the idea itself, it is continually revised as experiments proceed.

## I Love Writing

I love writing. Sometimes I think my greatest research asset is not
coming up with novel ideas, or fusing recent ideas with old ones, or
deep math, but communicating ideas.

Interestingly, I learned a lot from my undergraduate years when I
spent years discussing and reviewing anime, and engaging in discourse (and later, all mediums for fiction). This engagement shares commonality. It is about coming up with an opinion, and figuring out how to best express and convince others of that opinion.

While not universal, many ideas are generally applicable: consision,
rhythm (e.g., punctuation), evocation. Concision is about minimalism
in expressing your ideas with few distractions. Rhythm is about
interrelatedness, connecting all ideas in an excerpt together.
Evocation is about the ideas and how they ruminate in our minds.

## Being a Nice Person

+ positivity

Something I'd like to inherit from Dvae's amazing enthusiasm in
inspring me so much to love what I do. I can't stress it enough.

## Lessons learned from Edward, or How My Opinion Has Changed Over My PPL Research

+ increasingly hated abstractions, and class objects
+ the more object oriented, the more difficult it was for the user experience
+ managing automation vs flexibility is a difficult balance and finding that balance is still in-progress; it will always be a concern in PPLs in the same way tensorflow strikes a right balance of mid-level work vs just programming things in C++
+ getting contribs from academia (ph.d. students, postdocs, etc.) is extremely difficult, even more so than i imagined. not only is there a funding issue, there's also a publication issue as well as psychological issue (they want to "own" something)

## I'm Glad Everyone's Not Bayesian

+ title referencing why everyone isn't bayesian paper from efron.
+ pointing out specific examples where it's hard t ohave come up with
  the idea from a byaesian POV
  + inge general, multiple perspectives are nice in this way

## On differentiable programming and probabilistic programming

transition from deep neural nets -> learning hierarchies to deep neural nets ->
learning programs.

functional programminga nd neural nets. purity but imperative
training, which respects computation and devices. imperative code
modifies states (variables/parameters)

how probabilistic programming relates and formalizes learning

+ see various ideas from pps workshop
+ IMO a key aspect is approximate correctness rather than always
  getting the true data distribution. it impedes all learning and
  practice
+ i would say it's all about how well you can exploit hardware
  + this implies not just differentiable programming but linear
    algebra

refs
+ popl 2018 plotkin https://www.youtube.com/watch?v=qhPBfysSYI8&app=desktop

## when youre doing full bayes youre not actually doing full bayes

+ normal latent variable, normal likelihood
+ full bayes would learn the posteior for theta. others would either point estimate or approximate it
+ however, theres an additional layer of uncertainty and thats the noise injected into the likelihood
+ full bayes would learn both theta and each data points epsilon
+ whats the application of knowing epsilon? it depends on how its interpreted. if noise, then it makes no sense
+ this relates to implicit models and whether you even need epsilon as a modeling assumption if you can just bake all distributions onto a latent space and write your likelihood as a deterministic function
+ this also relates to more foundational work where they split noise and arameters and aim to learn distributions over parameters ehile avoiding any interest in epsilon.

## why probabilistic generative models?

+ Simplicity. All we need is the notion of a random variable to capture information in the world. This fundamental idea is the key building block for all analysis of empirical information. It empowers the scientific method (Box, 1976). It can capture any (currently) imaginable task, whether it be supervised learning, semi-supervised, unsupervised learning, reinforcement learning, missing data, active learning, streatming data, privacy, solving numerical algorithms () and optimization () themselves. All through one language of distributions. Moreover, from a modern Bayesian perspective, we don't even need the notion of "parameters" (de Finetti).
+ A language for uncertainty. It is deeply rooted through roughly two hundred years of probability and one hundred years of statistics. It allows one to capture uncertainty in data and or uncertainty in hidden structure. It is a natural extension of our language for determinism and logic (Pearl, 1988).
+ A language for manipulation. Formulating a generative process inherently posits a causal model. This enables interventions (Pearl, 2000) and methods to infer and validate causal effects.
+ Modularity and compositionality. Key idea of graphical models (Jordan, 1999).
+ Sharing statistical strength. Key idea of hierarchical models (Gelman and Hill, 2006).
+ Model criticism. Can easily check our modeling assumptions and fit to data by generating from them, and comparing to true data (Box, 1980, Rubin, 1984).
+ Understanding and exploration. Easy to interpret and introspect high-dimensional by viewing a model's latent structure. This connects to model criticism and modularity, in that the building blocks allow us to compare various pieces and inspect our model. It connects to causality, in that we can manipulate components and view its output (c.f., interpolation through examples as in DCGAN, analogical reasoning asin rumelhardt and mikolov) Understanding also lets us build robust models, removing sensitivity to outliers (Huber) or adversarial examples (Goodfellow).
+ Data efficiency. Probabilistic generative models can capture all data structures and sizes of data structures. It can vary from explicit prior knowledge to capture small to medium size data sets to little prior knowledge to allow massive data sets to overwhelm our priors and automate feature engineering.

references
+ http://www.cs.toronto.edu/~duvenaud/courses/csc2541/index.html
+ ian goodfellow's nips tutorial
+ bengio et al representation learning survey

## experiments part 2

+ update my experiments blog post (or write a part 2 saying
  what changed after openai and google, e.g., single directory for
  both checkpoints/ and log/ due to model_dir in estimator API; and
  distributed filesystem in storing data)

## "You've had the most unconventional PhD of anyone I know." Keyon Vafa.

Yes, I should outline this and what I got from it. This would be a fun anecdotal PhD and my experiences which might help others

I think the most important aspect was that I did not care at all how things ended up. All I cared about (and still care about) has been the pursuit of research. A PhD is a once-in-a-life opportunity to pursue several years of learning long term pursuits that deeply impacts your way of thinking from then on. As someone deeply interested in research, I wanted to set that out from the get-go.

I don't regret my decision at all. (But of course, it's hard to do the counterfactual.) I learned a lot from choosing a program for my Ph.D. followed by immediately transferring.

## my equipment

I love my setup, from hardware to software. I'm going to detail it and how it's
optimized for research and coding.

## my new workflow following t2t doc. then link to it from the doc
## one problem with likelihoods

Likelihoods are nice. Statistically, Fisher, classical literature of
asymptotics of MLE. MDL, compression.

Short blog post that likelihood’s are not useful for transfer learning
and anomaly detection. Talk about the surprising result of balajis

CIFAR -> SVHN. Should this be surprising? No. Consider a synthetic set
of blank images, each of a specific color (pixel intensity). The log
prob of this is even higher than CIFAR. Fundamentally, this says that
these are more compressible than CIFAR. So why should it be surprising
that test set likelihoods can be greater than train set?

Consider also a Gaussian....

See also KL divergence argument.

Note this holds irrespective of the model for p(x). The argument in
Balaji's paper is overly complicated.

## Why are Gaussian processes so good?

+ Analyze all sorts of variations in understanding its epistemic uncertainty and aleatoric. Try out the different things like attention. Under a specific set of properties, conclude the optimal is the GP formula.

## What do really mean by "Bayesian"?

Motivated by DNN research and whether something is a Baysian NN:
dropout, ensembles, SWAG, variational dropout, rank-1 BNNs.

## OOD Detection is a Bad Task

Reliable systems are important. Robustness is important.Uncertainty is important. Both highlighted as important properties. The most open challenge which has stifled progress---and has been echoed in every workshop panel ever---is evaluation.

OOD accuracy is new. Calibration error. Recently, OOD detection has arisen as a potential evaluation protocol.

OOD dtection is about X. You actually really care about Y, rejection.
In fact, some papers even attempt to solve Y while being motivated in
terms of X.

Some papers acknowledge this fact by including "misclassification
detection". But over various papers, it has converged to just OOD
detection.

### why?

difficulty of doing experiments with Y. X can be established in terms
of a concrete experiment: ...

### what happens if you try Y

Yuo just invented a version of calibration error!

Good: No discretization. CDF vs PDF.
Bad: AUC 1.0 is not actually the best. Perfectly calibrated model does not actually achieve this.

Note both this curve and calibration error do not account for
examples.

This is why I prefer calibration.
Perfect calibration implies perfect classification by reject as a
corollary.

### explain all the other variants plots

+ reliability diagrams (possibly with acc-conf on y-axis)
+ number of examples in plot
+ ashuka et al (2020)


blog post on experiment workflow (developing all research in open-source; give credit for noam shazeer)

## AI has a Media Problem

The AI field has benefited tremendously from science fiction. By
introducing core ideas into the general population, hype arounds its
potentials has arguably driven much of the technological funding
behind its advances. It's the reason today why classes are
consistently full (X) among all other computer science courses, why
industries apply so much funding to it, and much of research which is
only tangentially related to AI gets renamed to AI (Google Resaerch ->
AI).

Such funding can also largely be attributed to overhype, such as Tesla
AI Bot.

This perspective has also been hugely detrimental to advances in the
field, largely humanistic: violent AI, or as sexual or friendly
companions. It ignores the real problems today that AI solves, in
favor of bombastic depictions and which can fit as part of a
compelling science fiction story.

## I could write something about the shift in high impact compute papers to large numbers of authors.

Why do such papers have so many authors? At the end of the day, it's one person launching the experiment and managing the most minute of details. However, getting there requires a significant amount of coordination including infra, the research vision's bets, and the space of ideas of explore. I think this is actually quite a good thing as it enables a significant amount of collaboration that goes beyond what is needed from a single research paper that makes more incremental gains.
