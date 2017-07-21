
setMethod(
    "bootstrap.p.value", c("GOSummarisedRank"),
    function(x, n = 1E3, ...){
        stopifnot(n >= 1)
        # Create a reference copy of the GO ranks
        go.ref <- x@table$rank
        # Fetch the reference rank of all features (to randomise them)
        feature.rand <- x@featureData$rank
        names(feature.rand) <- rownames(x@featureData)
        # Initialise a counter for the P-value
        P.count <- rep(0, length(go.ref))
        names(P.count) <- rownames(go.ref)
        # Create N replicates (columns) of randomised feature ranks
        for (N in seq(from = 1, to = n, by = 1)){
            message("Iteration: ", N)
            # Randomise
            names(feature.rand) <- sample(names(feature.rand))
            # New ranks
            gr <- .GOrank(feature.rand, x@GOMap, ...)
            # Is the random rank lower than the real one?
            rand.lower <-
                gr@table[names(P.count), 'rank'] < go.ref[names(P.count)]
            P.count <- P.count + rand.lower
        }
        x@table$P <- P.count[rownames(x@table)]
        # Note: 'almost' extends GOSummarisedRank
        gbr <- GOBootstrapRank(
            table = x@table,
            metric = x@metric,
            GOMap = x@GOMap,
            featureData = x@featureData,
            pFactor = x@pFactor,
            n.bootstrap = n
        )
        return(gbr)
    }
)
