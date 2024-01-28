#!/usr/bin/perl -w

# This file is part of Product Opener.
#
# Product Opener
# Copyright (C) 2011-2024 Association Open Food Facts
# Contact: contact@openfoodfacts.org
# Address: 21 rue des Iles, 94100 Saint-Maur des Fossés, France
#
# Product Opener is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

=head1 DESCRIPTION

This cgi script initiates sign-in process with the OIDC service (eg. keycloak)

It redirects to the OIDC service, which will redirect back to oidc-signin-callback.pl

=cut

use ProductOpener::PerlStandards;

use CGI::Carp qw(fatalsToBrowser);

use ProductOpener::Auth qw/:all/;
use ProductOpener::Display qw/:all/;
use ProductOpener::Routing qw/:all/;

use Log::Any qw($log);

$log->info('start') if $log->is_info();

my $request_ref = init_request();
analyze_request($request_ref);

access_to_protected_resource($request_ref);

1;
