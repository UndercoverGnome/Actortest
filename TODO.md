REFACTOR PROGRAM:

instead of actors being stored in an array inside chunks, actors should be stored in a list in world.
Chunks should contain a list of **references** to actors (ids), so that we get the benefits of spatial partitioning, but avoid the desync pitfalls that come with actors being bound to chunks.
