function [sorted_data_table] = table_reorder(data_table,cell_array)
%TABLE_REORDER tableをCellArrayに応じて並べ替える。CellArrayは不完全でも良い。
%

%CellArrayが横ベクトルになるよう変更
if size(cell_array,1) > size(cell_array,2)
    cell_array = cell_array';
end

%table変数名の読み込み
variable_names = data_table.Properties.VariableNames;

%cell_arrayで選んだ変数以外を後段へ持っていく
has_cell_array = strcmp(variable_names,variable_names);
for i = 1:length(cell_array)
    has_cell_array = has_cell_array & ~strcmp(variable_names,cell_array{i});
end

variable_name_list = [cell_array variable_names(has_cell_array) ];

sorted_data_table = data_table(:,variable_name_list);



end

