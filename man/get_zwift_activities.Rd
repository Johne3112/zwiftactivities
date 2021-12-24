\name{get_zwift_activities}
\alias{get_zwift_activities}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get Zwift Activities
}
\description{
Returns a data frame of Zwift activities of length of the passed input.
}
\usage{
get_zwift_activities(un,pw,limit)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{un}{your Zwift username}
  \item{pw}{your Zwift password}
  \item{limit}{the number of activities to return, starting from the most recent activity}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
A data frame of your most recent n Zwift activities
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
John Peters
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x)
{
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
