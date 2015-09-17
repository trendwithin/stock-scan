require 'barchart_data'
require 'active_record'
require 'mechanize'

module BarchartData
  class Scraper
    attr_reader :urls, :agent

    def initialize
      @urls = {
        all_time_high: 'http://www.barchart.com/stocks/athigh.php?_dtp1-0',
        new_high: 'http://www.barchart.com/stocks/high.php?_dtp1-0',
        new_low: 'http://www.barchart.com/stocks/low.php?_dtp1=0',
        all_time_low: 'http://www.barchart.com/stocks/atlow.php?_dtp1=0'
      }
      @agent = Mechanize.new
    end

    def data_extraction
      @urls.each do |sym, url|
        parse_url = @agent.get("#{url}").search("input")
        symbols = self.strip_symbols(parse_url)
        self.insert_symbols(sym, symbols)
      end
    end

    def strip_symbols page
      symbols = page[6].to_s
      strip_symbols = symbols.scan(/[A-Z]+,[^a-z]+[A-Z]/)
      tickers = strip_symbols[0].split(',')
    end

    def insert_symbols sym, symbols
      case sym
      when :all_time_high
        symbols.each do |s|
          ::AllTimeHigh.create(symbol: s, saved_on: Time.current)
        end
      when :new_high
        symbols.each do |s|
          ::NewHigh.create(symbol: s, saved_on: Time.current)
        end
      when :new_low
        symbols.each do |s|
          ::NewLow.create(symbol: s, saved_on: Time.current)
        end
      when :all_time_low
        symbols.each do |s|
          ::AllTimeLow.create(symbol: s, saved_on: Time.current)
        end
      end
    end
  end
end
