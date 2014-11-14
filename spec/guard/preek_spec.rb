require 'spec_helper'

describe Guard::Preek do

  Given(:guard){ Guard::Preek.new(options) }
  Given(:options){ Hash.new }
  Given(:paths){ ['some_file.rb'] }
  Given(:runner){ double('runner', perform: true) }


  context '#run_on_changes' do
    When{ guard.run_on_changes(paths) }

    context 'with no options' do
      Given{ Guard::Preek::Runner.should_receive(:new).with(paths, options[:report]).and_return(runner) }
      Given{ runner.should_receive(:perform) }
      Then{ 'its great' }
    end

    context 'with "report: :verbose" option' do
      Given(:options){ {report: :verbose} }
      Given(:runner){ double('runner', perform: true) }
      Given{ Guard::Preek::Runner.should_receive(:new).with(paths, options[:report]).and_return(runner) }
      Given{ runner.should_receive(:perform) }
      Then{ 'its great' }
    end
  end

  context '#run_all' do
    context 'with "run_all_dir" option' do
      Given(:options){ {run_all_dir: 'lib'} }
      Given(:runner){ double('runner', perform: true) }
      Given{ Guard::Preek::Runner.should_receive(:new).with(options[:run_all_dir], options[:report]).and_return(runner) }
      Given{ runner.should_receive(:perform) }
      When{ guard.run_all }
      Then{ 'also great' }
    end

    context 'with "report: verbose" option' do
      Given(:options){ {report: :verbose, run_all_dir: 'lib'} }
      Given(:runner){ double('runner', perform: true) }
      Given{ Guard::Preek::Runner.should_receive(:new).with(options[:run_all_dir], options[:report]).and_return(runner) }
      Given{ runner.should_receive(:perform) }
      When{ guard.run_all }
      Then{ 'its great' }
    end

    context 'with no options' do
      Then{
        Guard::UI.should_receive(:error).with(/Guardfile/)
        expect { guard.run_all }.to throw_symbol :task_has_failed
      }
    end
  end
end