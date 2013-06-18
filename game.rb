require './lib/sudoku'
require 'sinatra'

post '/' do
  cell_values = params[:cells] # extract the cell values from the params hash
  puzzle_string = cell_values # convert to a string
  sudoku = Sudoku.new(puzzle_string) # create new instance of model class
  @message = sudoku.solve? ? "You won" : "You lost"
  @cells = sudoku.cells
  erb :home
end

get '/' do
	@cells = Sudoku.generate
	erb :home
end

