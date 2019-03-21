# Encoding: utf-8
# Copyright 2014 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'fileutils'
require 'pathname'
require 'rest_client'
require 'yaml'

module Utils

  def download(url, destination)
    cache_file = Pathname.new(destination)
    FileUtils.makedirs cache_file.parent unless cache_file.parent.exist?

    puts "Downloading #{destination} from #{url}..."

    cache_file.write(RestClient.get(url)) unless cache_file.exist?
  end

end
