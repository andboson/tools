tools
=====


git settings:


  core.compression = 9 - Flag for gzip to specify the compression level for blobs and packs. Level 1 is fast with larger file sizes, level 9 takes more time but results in better compression.
  repack.usedeltabaseoffset = true - Defaults to false for compatibility reasons, but is supported with Git >=1.4.4.
  pack.windowMemory = 100m - (Re)packing objects may consume lots of memory. To prevent all your resources [from going] down the drain it's useful to put some limits on that. There is also pack.deltaCacheSize.
  pack.window = 15 - Defaults to 10. With a higher value, Git tries harder to find similar blobs.
  gc.auto = 1000 - Defaults to 6700. As indicated in the article, it is recommended to run git gc every once in a while. Personally, I run git gc --auto everyday, so [it] only packs things when there's enough garbage. git gc --auto normally only triggers the packing mechanism when there are 6700 loose objects around. This flag lowers this amount.
  gc.autopacklimit 10 - Defaults to 50. Every time you run git gc, a new pack is generated [of] the loose objects. Over time you get too many packs which wastes space. It is a good idea to combine all packs once in a while into a single pack, so all objects can be combined and deltified. By default git gc does this when there are 50 packs around. But for this situation a lower number may be better.




reference: http://robmd.net/blog/database-backup-with-git.html
