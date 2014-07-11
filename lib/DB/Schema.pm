use utf8;
package DB::Schema 1.0;


# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07040 @ 2014-07-10 12:00:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:n9JK7Gl+2e03tfYzx4StzQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable(inline_constructor => 0);

sub connection {
     my $self = shift;
     my $rv = $self->next::method( @_ );
#     $rv->storage->sql_maker->quote_char('`');
#     $rv->storage->sql_maker->name_sep('.');
     return $rv;
 }
 
1;
