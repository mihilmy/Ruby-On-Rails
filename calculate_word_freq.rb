
class LineAnalyzer
    attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number
    def initialize(content, line_number)
        @content = content
        @line_number = line_number
        calculate_word_frequency
    end
    def calculate_word_frequency
        line = Hash.new
        @content.split.each {|word| line[word.downcase] = 0 if line[word.downcase].nil?
            line[word.downcase] += 1
        }
        @highest_wf_count = line.values.max
        @highest_wf_words = line.select { |k,v| v == @highest_wf_count}.keys
    end
end

#  Implement a class called Solution.
class Solution

    attr_reader :analyzers,:highest_count_across_lines,:highest_count_words_across_lines
    def initialize
        @analyzers = []
    end
    def analyze_file
        lineno = 0
        File.foreach("test.txt") { |line|
            @analyzers.push(LineAnalyzer.new(line, lineno += 1))
        }
    end

    def calculate_line_with_highest_frequency
        @highest_count_words_across_lines = []
        @highest_count_across_lines = @analyzers.max_by { |line_analyzer| line_analyzer.highest_wf_count }.highest_wf_count
        @highest_count_words_across_lines = @analyzers.select {|line_analyzer| line_analyzer.highest_wf_count == @highest_count_across_lines}

    end

    def print_highest_word_frequency_across_lines
        @highest_count_words_across_lines.each { |x|
            puts "#{x.highest_wf_words} (appears in line #{x.line_number})"
        }
    end
    s1 = Solution.new
    s1.analyze_file
    p s1.analyzers
end
