#
# Cookbook Name:: dropbox
# Recipe:: default
#
# Copyright 2011, Chris Peplin
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node[:platform]
when "ubuntu","debian"
  apt_repository "dropbox" do
    uri "http://linux.dropbox.com/ubuntu"
    distribution node['lsb']['codename']
    components ["main"]
    keyserver "pgp.mit.edu"
    key "5044912E"
  end

  package "python-gpgme"
  package "dropbox"
when "arch"
  include_recipe "pacman"
  pacman_aur "dropbox-daemon"
  pacman_aur "dropbox-cli"
end
