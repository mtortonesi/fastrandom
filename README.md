# Fastrandom

This gem is an exercise of style, devised to investigate:

1. the best practices in the development of Ruby gems containing C code
   (traditional MRI C extension interface does not work in JRuby and should
   thus be ditched in favor of more portable solutions);
2. the potential performance gains, for scientific computing purposes, offered
   by [state-of-the-art Pseudo Random Number Generators
   (PRNGs)](https://nullprogram.com/blog/2017/09/21/) over the old school PRNG
   based on the Mersenne Twister algorithm implemented in both MRI and JRuby.

As a result, I *strongly recommend not to use this code for any real-life
applications*. Indeed, at the moment of this writing (June 14th, 2020), the
code in this gem is *slower* than MRI's and JRuby's default PRNG
implementation. (See section Benchmark below for more information.)



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fastrandom'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fastrandom

## Benchmark

Here are the results obtained when executing the bin/benchmark script with
JRuby 9.2.11.1 on a 2016 Dell XPS running Linux Arch 64-bit (kernel 5.6.13):

    jruby-9.2.11.1
    Rehearsal ----------------------------------------------
    fastrandom   1.770000   0.060000   1.830000 (  0.967270)
    random       0.700000   0.030000   0.730000 (  0.377934)
    ------------------------------------- total: 2.560000sec

                     user     system      total        real
    fastrandom   0.730000   0.050000   0.780000 (  0.726169)
    random       0.320000   0.020000   0.340000 (  0.332982)

The benchmark compares fastrandom with the default random number generator,
indicated as _random_, of the Ruby system library.

And here are the results with MRI 2.7.1 on the same machine:

    2.7.1
    Rehearsal ----------------------------------------------
    fastrandom   0.911116   0.003769   0.914885 (  0.926847)
    random       0.351022   0.009696   0.360718 (  0.365660)
    ------------------------------------- total: 1.275603sec
    
                     user     system      total        real
    fastrandom   0.919464   0.003296   0.922760 (  0.934760)
    random       0.354044   0.003121   0.357165 (  0.361642)

As you can see, despite leveraging the xoroshiro128+ algorithm, which is deemed
to be [significantly faster than the old and venerable Mersenne
Twister](https://nullprogram.com/blog/2017/09/21/) used by the default PRNG of
both MRI and JRuby, fastrandom is overall noticeably slower than the default
PRNG. I haven't been able to pinpoint the reason yet, but I speculate that the
overhead brought by the FFI interface dominates the performance gains brought
by xoroshiro.



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mtortonesi/fastrandom.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
