// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

// @rails/ujsのインポートを修正
import Rails from "@rails/ujs";
Rails.start();
