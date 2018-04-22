/*
# Perl binding for POSIX extended locale support.
# Copyright (C) 2002-2018 Guido Flohr <guido.flohr@cantanea.com>,
# all rights reserved.

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

void
init_threads()
    CODE: 
        unsigned i;

        for (i = 0; i < libintl_mutex_size; ++i) {
            pthread_mutex_init(locks + i, NULL);
        }

void
libintl_lock(what)
             LibintlMutex what
    CODE:
        pthread_mutex_lock(locks + what);

void
libintl_unlock(what)
               LibintlMutex what
    CODE:
        pthread_mutex_unlock(locks + what);

