use utf8;
package DB::Schema::Result::Stock;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Stock

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<stocks>

=cut

__PACKAGE__->table("stocks");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 a

  data_type: 'float'
  is_nullable: 0

=head2 y

  data_type: 'float'
  is_nullable: 0

=head2 b

  data_type: 'float'
  is_nullable: 0

=head2 d

  data_type: 'float'
  is_nullable: 0

=head2 b2

  data_type: 'float'
  is_nullable: 0

=head2 r1

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 b3

  data_type: 'float'
  is_nullable: 0

=head2 q

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 p

  data_type: 'float'
  is_nullable: 0

=head2 o

  data_type: 'float'
  is_nullable: 0

=head2 c1

  data_type: 'float'
  is_nullable: 0

=head2 d1

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 c

  data_type: 'float'
  is_nullable: 0

=head2 d2

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 c6

  data_type: 'float'
  is_nullable: 0

=head2 t1

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 k2

  data_type: 'float'
  is_nullable: 0

=head2 p2

  data_type: 'float'
  is_nullable: 0

=head2 c8

  data_type: 'float'
  is_nullable: 0

=head2 m5

  data_type: 'float'
  is_nullable: 0

=head2 c3

  data_type: 'float'
  is_nullable: 0

=head2 m6

  data_type: 'float'
  is_nullable: 0

=head2 g

  data_type: 'float'
  is_nullable: 0

=head2 m7

  data_type: 'float'
  is_nullable: 0

=head2 h

  data_type: 'float'
  is_nullable: 0

=head2 m8

  data_type: 'float'
  is_nullable: 0

=head2 k1

  data_type: 'float'
  is_nullable: 0

=head2 m3

  data_type: 'float'
  is_nullable: 0

=head2 l

  data_type: 'float'
  is_nullable: 0

=head2 m4

  data_type: 'float'
  is_nullable: 0

=head2 l1

  data_type: 'float'
  is_nullable: 0

=head2 t8

  data_type: 'float'
  is_nullable: 0

=head2 w1

  data_type: 'float'
  is_nullable: 0

=head2 g1

  data_type: 'float'
  is_nullable: 0

=head2 w4

  data_type: 'float'
  is_nullable: 0

=head2 g3

  data_type: 'float'
  is_nullable: 0

=head2 p1

  data_type: 'float'
  is_nullable: 0

=head2 g4

  data_type: 'float'
  is_nullable: 0

=head2 m

  data_type: 'float'
  is_nullable: 0

=head2 g5

  data_type: 'float'
  is_nullable: 0

=head2 m2

  data_type: 'float'
  is_nullable: 0

=head2 g6

  data_type: 'float'
  is_nullable: 0

=head2 k

  data_type: 'float'
  is_nullable: 0

=head2 v

  data_type: 'float'
  is_nullable: 0

=head2 j

  data_type: 'float'
  is_nullable: 0

=head2 j1

  data_type: 'float'
  is_nullable: 0

=head2 j5

  data_type: 'float'
  is_nullable: 0

=head2 j3

  data_type: 'float'
  is_nullable: 0

=head2 k4

  data_type: 'float'
  is_nullable: 0

=head2 f6

  data_type: 'float'
  is_nullable: 0

=head2 j6

  data_type: 'float'
  is_nullable: 0

=head2 n

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 k5

  data_type: 'float'
  is_nullable: 0

=head2 n4

  data_type: 'text'
  is_nullable: 0

=head2 w

  data_type: 'float'
  is_nullable: 0

=head2 s

  data_type: 'text'
  is_nullable: 0

=head2 s1

  data_type: 'integer'
  is_nullable: 0

=head2 x

  data_type: 'text'
  is_nullable: 0

=head2 j2

  data_type: 'integer'
  is_nullable: 0

=head2 a5

  data_type: 'float'
  is_nullable: 0

=head2 b6

  data_type: 'float'
  is_nullable: 0

=head2 k3

  data_type: 'float'
  is_nullable: 0

=head2 t7

  data_type: 'float'
  is_nullable: 0

=head2 a2

  data_type: 'float'
  is_nullable: 0

=head2 t6

  data_type: 'float'
  is_nullable: 0

=head2 i5

  data_type: 'float'
  is_nullable: 0

=head2 l2

  data_type: 'float'
  is_nullable: 0

=head2 e

  data_type: 'float'
  is_nullable: 0

=head2 l3

  data_type: 'float'
  is_nullable: 0

=head2 e7

  data_type: 'float'
  is_nullable: 0

=head2 v1

  data_type: 'float'
  is_nullable: 0

=head2 e8

  data_type: 'float'
  is_nullable: 0

=head2 v7

  data_type: 'float'
  is_nullable: 0

=head2 e9

  data_type: 'float'
  is_nullable: 0

=head2 b4

  data_type: 'float'
  is_nullable: 0

=head2 j4

  data_type: 'float'
  is_nullable: 0

=head2 p5

  data_type: 'float'
  is_nullable: 0

=head2 p6

  data_type: 'float'
  is_nullable: 0

=head2 r

  data_type: 'float'
  is_nullable: 0

=head2 r2

  data_type: 'float'
  is_nullable: 0

=head2 r5

  data_type: 'float'
  is_nullable: 0

=head2 r6

  data_type: 'float'
  is_nullable: 0

=head2 r7

  data_type: 'float'
  is_nullable: 0

=head2 s7

  data_type: 'float'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 1 },
  "time",
  { data_type => "timestamp", set_on_create => 1, default_value => '\now()' },
  "a",
  { data_type => "float", is_nullable => 1 },
  "y",
  { data_type => "float", is_nullable => 1 },
  "b",
  { data_type => "float", is_nullable => 1 },
  "d",
  { data_type => "float", is_nullable => 1 },
  "b2",
  { data_type => "float", is_nullable => 1 },
  "r1",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "b3",
  { data_type => "float", is_nullable => 1 },
  "q",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "p",
  { data_type => "float", is_nullable => 1 },
  "o",
  { data_type => "float", is_nullable => 1 },
  "c1",
  { data_type => "float", is_nullable => 1 },
  "d1",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "c",
  { data_type => "float", is_nullable => 1 },
  "d2",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "c6",
  { data_type => "float", is_nullable => 1 },
  "t1",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "k2",
  { data_type => "float", is_nullable => 1 },
  "p2",
  { data_type => "float", is_nullable => 1 },
  "c8",
  { data_type => "float", is_nullable => 1 },
  "m5",
  { data_type => "float", is_nullable => 1 },
  "c3",
  { data_type => "float", is_nullable => 1 },
  "m6",
  { data_type => "float", is_nullable => 1 },
  "g",
  { data_type => "float", is_nullable => 1 },
  "m7",
  { data_type => "float", is_nullable => 1 },
  "h",
  { data_type => "float", is_nullable => 1 },
  "m8",
  { data_type => "float", is_nullable => 1 },
  "k1",
  { data_type => "float", is_nullable => 1 },
  "m3",
  { data_type => "float", is_nullable => 1 },
  "l",
  { data_type => "float", is_nullable => 1 },
  "m4",
  { data_type => "float", is_nullable => 1 },
  "l1",
  { data_type => "float", is_nullable => 1 },
  "t8",
  { data_type => "float", is_nullable => 1 },
  "w1",
  { data_type => "float", is_nullable => 1 },
  "g1",
  { data_type => "float", is_nullable => 1 },
  "w4",
  { data_type => "float", is_nullable => 1 },
  "g3",
  { data_type => "float", is_nullable => 1 },
  "p1",
  { data_type => "float", is_nullable => 1 },
  "g4",
  { data_type => "float", is_nullable => 1 },
  "m",
  { data_type => "float", is_nullable => 1 },
  "g5",
  { data_type => "float", is_nullable => 1 },
  "m2",
  { data_type => "float", is_nullable => 1 },
  "g6",
  { data_type => "float", is_nullable => 1 },
  "k",
  { data_type => "float", is_nullable => 1 },
  "v",
  { data_type => "float", is_nullable => 1 },
  "j",
  { data_type => "float", is_nullable => 1 },
  "j1",
  { data_type => "float", is_nullable => 1 },
  "j5",
  { data_type => "float", is_nullable => 1 },
  "j3",
  { data_type => "float", is_nullable => 1 },
  "k4",
  { data_type => "float", is_nullable => 1 },
  "f6",
  { data_type => "float", is_nullable => 1 },
  "j6",
  { data_type => "float", is_nullable => 1 },
  "n",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "k5",
  { data_type => "float", is_nullable => 1 },
  "n4",
  { data_type => "text", is_nullable => 1 },
  "w",
  { data_type => "float", is_nullable => 1 },
  "s",
  { data_type => "text", is_nullable => 1 },
  "s1",
  { data_type => "integer", is_nullable => 1 },
  "x",
  { data_type => "text", is_nullable => 1 },
  "j2",
  { data_type => "integer", is_nullable => 1 },
  "a5",
  { data_type => "float", is_nullable => 1 },
  "b6",
  { data_type => "float", is_nullable => 1 },
  "k3",
  { data_type => "float", is_nullable => 1 },
  "t7",
  { data_type => "float", is_nullable => 1 },
  "a2",
  { data_type => "float", is_nullable => 1 },
  "t6",
  { data_type => "float", is_nullable => 1 },
  "i5",
  { data_type => "float", is_nullable => 1 },
  "l2",
  { data_type => "float", is_nullable => 1 },
  "e",
  { data_type => "float", is_nullable => 1 },
  "l3",
  { data_type => "float", is_nullable => 1 },
  "e7",
  { data_type => "float", is_nullable => 1 },
  "v1",
  { data_type => "float", is_nullable => 1 },
  "e8",
  { data_type => "float", is_nullable => 1 },
  "v7",
  { data_type => "float", is_nullable => 1 },
  "e9",
  { data_type => "float", is_nullable => 1 },
  "b4",
  { data_type => "float", is_nullable => 1 },
  "j4",
  { data_type => "float", is_nullable => 1 },
  "p5",
  { data_type => "float", is_nullable => 1 },
  "p6",
  { data_type => "float", is_nullable => 1 },
  "r",
  { data_type => "float", is_nullable => 1 },
  "r2",
  { data_type => "float", is_nullable => 1 },
  "r5",
  { data_type => "float", is_nullable => 1 },
  "r6",
  { data_type => "float", is_nullable => 1 },
  "r7",
  { data_type => "float", is_nullable => 1 },
  "s7",
  { data_type => "float", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<stocks_n>

=over 4

=item * L</n>

=back

=cut

=head2 C<stocks_s>

=over 4

=item * L</s>

=back

=cut

# Created by DBIx::Class::Schema::Loader v0.07040 @ 2014-07-10 12:00:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CNXr3XIv+ODhjvptoSn3pg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;

__DATA__


Symbol,Description
a,Ask
y,Dividend Yield
b,Bid
d,Dividend per Share
b2,Ask (Realtime)
r1,Dividend Pay Date
b3,Bid (Realtime)
q,Ex-Dividend Date
p,Previous Close
o,Open
c1,Change
d1,Last Trade Date
c,Change & Percent Change
d2,Trade Date
c6,Change (Realtime)
t1,Last Trade Time
k2,Change Percent (Realtime)
p2,Change in Percent
c8,After Hours Change (Realtime)
m5,Change From 200 Day Moving Average
c3,Commission
m6,Percent Change From 200 Day Moving Average
g,Day’s Low
m7,Change From 50 Day Moving Average
h,Day’s High
m8,Percent Change From 50 Day Moving Average
k1,Last Trade (Realtime) With Time
m3,50 Day Moving Average
l,Last Trade (With Time)
m4,200 Day Moving Average
l1,Last Trade (Price Only)
t8,1 yr Target Price
w1,Day’s Value Change
g1,Holdings Gain Percent
w4,Day’s Value Change (Realtime)
g3,Annualized Gain
p1,Price Paid
g4,Holdings Gain
m,Day’s Range
g5,Holdings Gain Percent (Realtime)
m2,Day’s Range (Realtime)
g6,Holdings Gain (Realtime)
k,52 Week High
v,More Info
j,52 week Low
j1,Market Capitalization
j5,Change From 52 Week Low
j3,Market Cap (Realtime)
k4,Change From 52 week High
f6,Float Shares
j6,Percent Change From 52 week Low
n,Name
k5,Percent Change From 52 week High
n4,Notes
w,52 week Range
s,Symbol
s1,Shares Owned
x,Stock Exchange
j2,Shares Outstanding
v,Volume
a5,Ask Size
b6,Bid Size
k3,Last Trade Size
t7,Ticker Trend
a2,Average Daily Volume
t6,Trade Links
i5,Order Book (Realtime)
l2,High Limit
e,Earnings per Share
l3,Low Limit
e7,EPS Estimate Current Year
v1,Holdings Value
e8,EPS Estimate Next Year
v7,Holdings Value (Realtime)
e9,EPS Estimate Next Quarter
b4,Book Value
j4,EBITDA
p5,Price / Sales
p6,Price / Book
r,P/E Ratio
r2,P/E Ratio (Realtime)
r5,PEG Ratio
r6,Price / EPS Estimate Current Year
r7,Price / EPS Estimate Next Year
s7,Short Ratio

__END__
