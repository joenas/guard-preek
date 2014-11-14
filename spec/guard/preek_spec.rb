require 'spec_helper'

describe Guard::Preek do

  Given(:guard){ Guard::Preek.new(options) }
  Given(:options){ Hash.new }
  Given(:paths){ ['some_file.rb'] }
  Given(:runner){ double('runner', perform: true) }


  context '#run_on_changes' do
    When{ guard.run_on_changes(paths) }

    context 'with no options' do
      Given{ expect(Guard::Preek::Runner).to receive(:new).with(paths, options[:report]).and_return(runner) }
      Given{ expect(runner).to receive(:perform) }
      Then{ 'its great' }
    end

    context 'with "report: :verbose" option' do
      Given(:options){ {report: :verbose} }
      Given(:runner){ double('runner', perform: true) }
      Given{ expect(Guard::Preek::Runner).to receive(:new).with(paths, options[:report]).and_return(runner) }
      Given{ expect(runner).to receive(:perform) }
      Then{ 'its great' }
    end
  end

  context '#run_all' do
    context 'with "run_all_dir" option' do
      Given(:options){ {run_all_dir: 'lib'} }
      Given(:runner){ double('runner', perform: true) }
      Given{ expect(Guard::Preek::Runner).to receive(:new).with(options[:run_all_dir], options[:report]).and_return(runner) }
      Given{ expect(runner).to receive(:perform) }
      When{ guard.run_all }
      Then{ 'also great' }
    end

    context 'with "report: verbose" option' do
      Given(:options){ {report: :verbose, run_all_dir: 'lib'} }
      Given(:runner){ double('runner', perform: true) }
      Given{ expect(Guard::Preek::Runner).to receive(:new).with(options[:run_all_dir], options[:report]).and_return(runner) }
      Given{ expect(runner).to receive(:perform) }
      When{ guard.run_all }
      Then{ 'its great' }
    end

    context 'with no options' do
      Then{
        expect(Guard::UI).to receive(:error).with(/Guardfile/)
        expect { guard.run_all }.to throw_symbol :task_has_failed
      }
    end
  end
end