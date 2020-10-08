function [sorted_data_table] = table_reorder(data_table,cell_array)
%TABLE_REORDER table��CellArray�ɉ����ĕ��בւ���BCellArray�͕s���S�ł��ǂ��B
%

%CellArray�����x�N�g���ɂȂ�悤�ύX
if size(cell_array,1) > size(cell_array,2)
    cell_array = cell_array';
end

%table�ϐ����̓ǂݍ���
variable_names = data_table.Properties.VariableNames;

%cell_array�őI�񂾕ϐ��ȊO����i�֎����Ă���
has_cell_array = strcmp(variable_names,variable_names);
for i = 1:length(cell_array)
    has_cell_array = has_cell_array & ~strcmp(variable_names,cell_array{i});
end

variable_name_list = [cell_array variable_names(has_cell_array) ];

sorted_data_table = data_table(:,variable_name_list);



end

