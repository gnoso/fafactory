# fafactory Guardfile
# More info for Guardfiles at https://github.com/guard/guard#readme

guard 'cucumber', :notification => false, :all_after_pass => false, :cli => '--profile focus' do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$}) { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { 'features' }
  watch(%r{^lib/.+\.rb$}) { 'features' }
  watch(%r{^cucumber.yml$}) { 'features' }
end